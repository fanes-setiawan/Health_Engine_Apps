import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import 'package:healthengineapps/widget/input/genderRadio.dart';
import '../../../model/colors/customColors.dart';
import '../../../state_util.dart';
import '../../../widget/input/bottomC.dart';
import '../../../widget/input/textform.dart';
import '../controller/signup_controller.dart';

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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: CustomColor.darkgreen,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              TextForm(
                label: 'Name',
                initial: '',
                helper: 'Enter your name',
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Gender",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                  ),
                ),
              ),
              GenderRadio(),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  controller: controller.dateinput,
                  decoration: InputDecoration(
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
                text: "Sign Up",
                color: CustomColor.darkgreen,
                onPressed: () {},
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(LoginView());
                  },
                  child: RichText(
                    text: TextSpan(
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
