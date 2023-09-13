import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;
  bool obcureState = true;

  visibility() {
    obcureState = !obcureState;
    setState(() {});
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  doLogin() async {
    try {
      bool isSuccess = await UserService().login(
        email: email!,
        password: password!,
      );

      if (isSuccess) {
        Get.to(DrawerScreen());
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
                    Text('email atau password tidak valid!!!'),
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
          },
        );
        print("Login failed");
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
}
