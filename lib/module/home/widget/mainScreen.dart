// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:healthengineapps/core.dart';
import 'package:healthengineapps/widget/input/imageButton.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(
          onPressed: () {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.teal.shade700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            children: AnimateList(
          interval: 1000.ms,
          effects: [FadeEffect(duration: 1000.ms)],
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    // borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/icons/health-engine-icon-transparent.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ImageButton(
              title: "My Profil",
              assetImage: "assets/icons/user.png",
              onPressed: () {
                Get.to(ProfileView());
              },
            ),
            Spacer(),
            ImageButton(
              title: "Logout",
              assetImage: "assets/icons/exit.png",
              onPressed: () {},
            )
          ],
        )),
      ),
    );
  }
}
