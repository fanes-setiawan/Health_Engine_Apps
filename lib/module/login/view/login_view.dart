import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import 'package:healthengineapps/module/home/widget/drawerScreen.dart';
import 'package:healthengineapps/state_util.dart';
import 'package:healthengineapps/widget/input/bottomC.dart';
import '../../../widget/input/textform.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              TextForm(
                label: 'Email',
                initial: 'akun@gmail.com',
                helper: 'Enter your email address',
              ),
              TextForm(
                label: 'Password',
                initial: "******",
                helper: 'Enter your password',
                suffix: Icon(Icons.visibility_off),
              ),
              SizedBox(height: 10.0),
              BottomC(
                text: "Login",
                color: Colors.blue,
                onPressed: () {
                  Get.offAll(DrawerScreen());
                },
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(SignupView());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Dont't hame account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
