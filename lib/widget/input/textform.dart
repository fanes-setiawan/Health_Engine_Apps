import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final String label;
  final String initial;
  final String helper;
  final Widget? suffix;

  TextForm(
      {Key? key,
      required this.label,
      required this.initial,
      required this.helper,
      this.suffix})
      : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: TextFormField(
        initialValue: widget.initial,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Colors.blueGrey,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          helperText: widget.helper,
          suffixIcon: widget.suffix,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
