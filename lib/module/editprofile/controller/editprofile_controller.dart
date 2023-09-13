import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import '../view/editprofile_view.dart';

class EditprofileController extends State<EditprofileView> {
  static late EditprofileController instance;
  late EditprofileView view;

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
