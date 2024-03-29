import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import '../controller/editprofile_controller.dart';

class EditprofileView extends StatefulWidget {
  const EditprofileView({Key? key}) : super(key: key);

  Widget build(context, EditprofileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Editprofile"),
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
  State<EditprofileView> createState() => EditprofileController();
}
