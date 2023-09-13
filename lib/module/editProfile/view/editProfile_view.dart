import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import '../../../widget/input/qImagePicker.dart';
import '../controller/editProfile_controller.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  Widget build(context, EditProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                QImagePicker(
                  label: "Photo",
                  hint: "Edit your photo profile",
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                Text(
                  "Fanes Setiawan",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 5,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Aktif",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                // TextForm(
                //   label: "Alamat",
                //   initial: "",
                //   helper: "enter your alamat",
                // ),
                // TextForm(
                //   label: "Golongan Darah",
                //   initial: "",
                //   helper: "enter your golongan darah",
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<EditProfileView> createState() => EditProfileController();
}
