import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final String label;
  final String? initial;
  final String helper;
  final bool obscureText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;

  TextForm({
    Key? key,
    required this.label,
    this.initial,
    required this.helper,
    required this.onChanged,
    this.validator,
    required this.obscureText,
    this.suffix,
  }) : super(key: key);

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
        cursorColor: Colors.black,
        validator: widget.validator,
        initialValue: widget.initial,
        obscureText: widget.obscureText,
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
        onChanged: (value) {
          widget.onChanged(value);
        },
      ),
    );
  }
}
