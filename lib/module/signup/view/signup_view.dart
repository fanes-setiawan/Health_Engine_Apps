import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import '../controller/signup_controller.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  Widget build(context, SignupController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<SignupView> createState() => SignupController();
}