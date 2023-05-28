import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../state_util.dart';
import '../controller/onboarding_controller.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  Widget build(context, OnboardingController controller) {
    controller.view = this;
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Personalized Health Assessment",
          body:
              "IAnalyzes user data to provide personalized insights into overall health status, potential risk factors, and recommendations for improvement.",
          image: Image.asset("assets/images/p4.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "AI-Powered Symptom Checker",
          body:
              "Allows users to input their symptoms and uses AI algorithms to match the symptoms with a database of diseases and medical conditions, providing potential diagnoses or recommended actions.",
          image: Image.asset("assets/images/p5.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Health Tracker and Analytics",
          body:
              "Utilizes analytics and visualization techniques to provide users with meaningful insights, trends, and personalized recommendations based on the tracked data.",
          image: Image.asset("assets/images/p1.png"),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        Get.to(LoginView());
      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      showBackButton: false,
      back: Icon(Icons.arrow_back),
      skip: Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: Text("Done"),
      dotsDecorator: DotsDecorator(
          size: Size(10, 10),
          color: Colors.grey,
          activeSize: Size(20, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )),
    );
  }

  @override
  State<OnboardingView> createState() => OnboardingController();
}
