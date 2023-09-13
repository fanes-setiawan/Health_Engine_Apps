import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import '../view/Analysis_view.dart';

class AnalysisController extends State<AnalysisView> {
  static late AnalysisController instance;
  late AnalysisView view;
  var responDataAnalysis;
  final CarouselController carouselController = CarouselController();
  bool isLoading = true;

  @override
  void initState() {
    instance = this;
    getAnalysis();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  getAnalysis() async {
    print("masuk pencegahan");
    try {
      print('masuk try');
      var response = await DataService().getDataAnalysis();
      print(response!.statusCode);
      if (response != null && response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        responDataAnalysis = jsonResponse['data'];
        isLoading = false;
        setState(() {});
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
