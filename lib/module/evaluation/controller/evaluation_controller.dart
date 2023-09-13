import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../core.dart';
import '../view/evaluation_view.dart';

class EvaluationController extends State<EvaluationView> {
  static late EvaluationController instance;
  late EvaluationView view;
  var data;
  late List<Map<String, dynamic>> dataKesehatan = [];
  final CarouselController carouselController = CarouselController();
  bool isLoading = true;

  @override
  void initState() {
    instance = this;
    getDetail();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  getDetail() async {
    print("Get Data Detail");
    try {
      var response = await DataService().getDataDetail();

      if (response != null && response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        data = jsonResponse['data'];
        print(data[0]['data_kesehatan'].toString());
        dataKesehatan = data[0]['data_kesehatan'];

        isLoading = false;
        setState(() {});
      } else {
        setState(() {
          isLoading = false;
        });
        print("gagal untuk get data");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
