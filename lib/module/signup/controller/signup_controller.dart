import 'package:flutter/material.dart';
import 'package:healthengineapps/state_util.dart';
import 'package:intl/intl.dart';
import '../view/signup_view.dart';

class SignupController extends State<SignupView> implements MvcController {
  static late SignupController instance;
  late SignupView view;
  Gender _selectedGender = Gender.FEMALE;
  TextEditingController dateinput = TextEditingController();

  Gender get selectedGender => _selectedGender;

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

  setGender(Gender gender) {
    _selectedGender = gender;
    setState(() {});
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
}

enum Gender { MALE, FEMALE, OTHER }
