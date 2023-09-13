import 'package:flutter/material.dart';

class GenderRadio extends StatelessWidget {
  final String genderTitle;
  final void Function(int) onChanged;
  final int value;
  final int groupValue;

  GenderRadio({
    required this.genderTitle,
    required this.onChanged,
    required this.value,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: (newValue) {
            onChanged(newValue as int);
          },
        ),
        Text(genderTitle),
      ],
    );
  }
}
