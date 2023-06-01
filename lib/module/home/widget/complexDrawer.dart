import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';

import '../../../state_util.dart';

class ComplexDrawer extends StatefulWidget {
  const ComplexDrawer({Key? key}) : super(key: key);

  @override
  _ComplexDrawerState createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  int selectedIndex = -1; //dont set it to 0

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: row(),
      color: Colors.black12,
    );
  }

  Widget row() {
    return Row(children: [
      isExpanded ? blackIconTiles() : blackIconMenu(),
      invisibleSubMenus(),
    ]);
  }

  Widget blackIconTiles() {
    return Container(
      width: 210,
      color: Colors.blue[200],
      child: Column(
        children: [
          controlTile(),
          accountTile(),
        ],
      ),
    );
  }

  Widget controlTile() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 30),
      child: ListTile(
        trailing: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: Colors.white,
            )),
        leading: Image.asset(
          "assets/images/logo.png",
          width: 30.0,
          height: 30.0,
          fit: BoxFit.fill,
        ),
        title: Text(
          "Health Engine",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget blackIconMenu() {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      width: 60,
      color: Colors.blue[400],
      child: Column(
        children: [
          controlButton(),
          accountButton(),
          Spacer(flex: 10),
          logoutAkun(),
        ],
      ),
    );
  }

  Widget invisibleSubMenus() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: isExpanded ? 0 : 125,
    );
  }

  Widget controlButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 30),
      child: InkWell(
        onTap: expandOrShrinkDrawer,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/logo.png",
            width: 30.0,
            height: 30.0,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget accountButton({bool usePadding = true}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: GestureDetector(
        onTap: () {
          Get.to(ProfileView());
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.white70,
            image: DecorationImage(
                image: NetworkImage(
                    'https://marketplace.canva.com/EAFEits4-uw/1/0/1600w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-oEqs2yqaL8s.jpg')),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget logoutAkun() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.logout_sharp,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget accountTile() {
    return Container(
      color: Colors.lightBlue,
      child: ListTile(
        leading: accountButton(usePadding: false),
        title: Text(
          "Fanes Setiawan",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
