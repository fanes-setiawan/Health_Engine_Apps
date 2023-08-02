import 'package:flutter/material.dart';
import 'package:healthengineapps/state_util.dart';
import '../view/Analysis_view.dart';

class AnalysisController extends State<AnalysisView> {
  static late AnalysisController instance;
  late AnalysisView view;

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
