import 'package:flutter/material.dart';
import 'package:healthengineapps/state_util.dart';
import '../view/evaluation_view.dart';

class EvaluationController extends State<EvaluationView> {
  static late EvaluationController instance;
  late EvaluationView view;

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
