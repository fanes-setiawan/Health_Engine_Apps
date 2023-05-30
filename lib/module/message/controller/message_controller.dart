import 'package:flutter/material.dart';
import 'package:healthengineapps/state_util.dart';
import '../view/message_view.dart';

class MessageController extends State<MessageView> implements MvcController {
  static late MessageController instance;
  late MessageView view;
  TextEditingController textEditingController = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  void sendMessage() {
    setState(() {
      String message = textEditingController.text;
      String time = TimeOfDay.now().format(context);

      messages.add({
        'message': message,
        'time': time,
      });
      textEditingController.clear();
    });
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
