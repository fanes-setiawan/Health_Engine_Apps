import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import 'package:intl/intl.dart';
import '../view/signup_view.dart';

class SignupController extends State<SignupView> implements MvcController {
  static late SignupController instance;
  late SignupView view;
  TextEditingController dateinput = TextEditingController();
  int selectedGender = 0;
  bool obcureState = true;

  visibility() {
    obcureState = !obcureState;
    setState(() {});
  }

  void handleGenderChange(int value) {
    setState(() {
      selectedGender = value;
    });
    if (selectedGender == 1) {
      gender = "male";
    } else if (selectedGender == 2) {
      gender = "female";
    } else {
      return;
    }
  }

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);

      setState(() {
        dateinput.text = formattedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  @override
  void initState() {
    dateinput.text = '';
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  UserService userService = UserService();
  String? name;
  String? email;
  String? password;
  String? gender;
  String? dateBirth;

  doRegister() async {
    try {
      dateBirth = dateinput.text;
      var response = await userService.register(
        name: name!,
        email: email!,
        password: password!,
        gender: gender!,
        birth_of_day: dateBirth!,
      );

      if (response.statusCode == 200) {
        Get.to(LoginView());
      } else {
        await showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Invalid'),
                content: const SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('isi data form dengan benar!!!'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Ok",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
