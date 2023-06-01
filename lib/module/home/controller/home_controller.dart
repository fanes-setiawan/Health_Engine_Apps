import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:healthengineapps/state_util.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  conditionScreen() {
    if (ZoomDrawer.of(context)!.isOpen()) {
      ZoomDrawer.of(context)!.close();
    } else {
      ZoomDrawer.of(context)!.open();
    }
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
