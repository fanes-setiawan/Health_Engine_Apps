import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
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
                    "Sign Up",
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
              LayoutBuilder(builder: (context, constraint) {
                List<Gender> gender = [Gender.FEMALE, Gender.MALE];
                return SizedBox(
                  height: 20,
                  child: ListView.builder(
                    itemCount: gender.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var gen = gender[index];
                      return Row(
                        children: [
                          Radio<Gender>(
                            value: gen,
                            groupValue: controller.selectedGender,
                            onChanged: (value) {
                              controller.setGender(gen);
                            },
                          ),
                          Text(gen.toString().split('.').last),
                        ],
                      );
                    },
                  ),
                );
              }),
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
                color: Colors.blue,
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
  State<SignupView> createState() => SignupController();
}
