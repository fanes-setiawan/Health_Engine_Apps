import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import 'package:healthengineapps/state_util.dart';
import '../view/profile_view.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;
  String? chosenValue;
  dynamic profileData;

  dropButtom(var value) {
    setState(() {
      chosenValue = value;
    });
  }

  @override
  void initState() {
    instance = this;
    getDataProfile();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  getDataProfile() async {
    try {
      var response = await UserService().getRequest();
      if (response != null && response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        profileData = jsonResponse['data'];

        setState(() {});
      } else {
        print("gagal get profile detail");
      }
    } catch (e) {
      print("error: $e");
    }
  }
}
