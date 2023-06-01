import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:healthengineapps/core.dart';
import 'package:healthengineapps/module/home/widget/mainScreen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

final zoomDrawerController = ZoomDrawerController();

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: MainScreen(),
      mainScreen: HomeView(),
      borderRadius: 24.0,
      style: DrawerStyle.defaultStyle,
      moveMenuScreen: false,
      showShadow: true,
      angle: 0.0,
      drawerShadowsBackgroundColor: Colors.grey.shade300,
      menuBackgroundColor: Colors.blue.shade300,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
