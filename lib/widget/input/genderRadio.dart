import 'package:flutter/material.dart';

class GenderRadio extends StatefulWidget {
  @override
  State<GenderRadio> createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  Gender _selectedGender = Gender.FEMALE;
  Gender get selectedGender => _selectedGender;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      List<Gender> gender = [Gender.FEMALE, Gender.MALE];

      setGender(Gender gender) {
        _selectedGender = gender;
        setState(() {});
      }

      return SizedBox(
        height: 20,
        child: ListView.builder(
          itemCount: gender.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var gen = gender[index];
            return Row(
              children: [
                Radio<Gender>(
                  value: gen,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setGender(gen);
                  },
                ),
                Text(gen.toString().split('.').last),
              ],
            );
          },
        ),
      );
    });
  }
}

enum Gender { MALE, FEMALE, OTHER }
