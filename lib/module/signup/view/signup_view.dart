import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';

import '../../../widget/input/genderRadio.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  Widget build(context, SignupController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      backgroundColor: Colors.white,
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
                    "Sign Up",
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
                label: 'Name',
                initial: '',
                obscureText: false,
                helper: 'Enter your name',
                onChanged: (value) {
                  controller.name = value;
                },
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Gender",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Row(
                children: [
                  GenderRadio(
                    genderTitle: 'Male',
                    onChanged: controller.handleGenderChange,
                    value: 1, // Set nilai yang sesuai untuk male
                    groupValue: controller.selectedGender,
                  ),
                  GenderRadio(
                    genderTitle: 'Female',
                    onChanged: controller.handleGenderChange,
                    value: 2, // Set nilai yang sesuai untuk female
                    groupValue: controller.selectedGender,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  controller: controller.dateinput,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    label: Text("enter date of birth"),
                  ),
                  readOnly: true,
                  onTap: () async {
                    controller.selectDate();
                  },
                ),
              ),
              TextForm(
                label: 'Email',
                helper: 'Enter your email address',
                obscureText: false,
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
                text: "Sign Up",
                color: CustomColor.darkgreen,
                onPressed: () {
                  controller.doRegister();
                },
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(const LoginView());
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
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
  State<SignupView> createState() => SignupController();
}
