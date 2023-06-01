// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
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
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade300,
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
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/logo.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Apps",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            ImageButton(
              title: "My Profil",
              assetImage: "assets/icons/user.png",
              onPressed: () {
                duration:
                const Duration(seconds: 10000);
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
        ),
      ),
    );
  }
}
