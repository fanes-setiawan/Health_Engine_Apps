import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: CustomColor.darkgreen,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              TextForm(
                label: 'Email',
                obscureText: false,
                helper: 'Enter your email address',
                onChanged: (value) {
                  controller.email = value;
                },
              ),
              TextForm(
                label: 'Password',
                helper: 'Enter your password',
                obscureText: controller.obcureState,
                suffix: IconButton(
                  onPressed: () => controller.visibility(),
                  icon: Icon(
                    controller.obcureState
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                  ),
                ),
                onChanged: (value) {
                  controller.password = value;
                },
              ),
              const SizedBox(height: 10.0),
              BottomC(
                  text: "Login",
                  color: CustomColor.darkgreen,
                  onPressed: () => controller.doLogin()),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(const SignupView());
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Don't have account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: CustomColor.darkgreen,
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
