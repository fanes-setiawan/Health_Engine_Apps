import 'package:flutter/material.dart';
import 'package:healthengineapps/state_util.dart';
import '../view/profile_view.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;
  String? chosenValue;

  dropButtom(var value) {
    setState(() {
      chosenValue = value;
    });
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
