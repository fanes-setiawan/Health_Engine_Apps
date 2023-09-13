import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import '../view/symptom_view.dart';

class SymptomController extends State<SymptomView> {
  static late SymptomController instance;
  late SymptomView view;
  int currentIndex = 0;
  double presentPrediction = 0.0;
  final CarouselController carouselController = CarouselController();
  List<dynamic> dataPrediction = [];
  bool isLoading = true;

  @override
  void initState() {
    instance = this;
    getData();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  getData() async {
    try {
      var response = await DataService().getDataPredicton();
      if (response != null && response.statusCode == 200) {
        setState(() {
          var jsonResponse = jsonDecode(response.body);
          dataPrediction = jsonResponse['data']['prediksi'][0]['detail'];
          presentPrediction =
              jsonResponse['data']['prediksi'][0]['presentase_kesehatan'];
          isLoading = false;
        });

        print("DATA::: ${dataPrediction}");
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
      print(e);
    }
  }
}
