import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({Key? key, required this.controller, required this.text, required this.phone, required this.onNumberChanged}) : super(key: key);

  final TextEditingController controller;
  final String text;
  final bool phone;
  final Function(PhoneNumber) onNumberChanged;

  @override
  Widget build(BuildContext context) {
    return !phone ?TextFormField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: Style.textStyle18,
        enabledBorder: const UnderlineInputBorder(
          borderSide:
          BorderSide(color: Color1.primaryColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:
          BorderSide(color: Color1.primaryColor),
        ),
      ),
      cursorColor: Color1.primaryColor,
      keyboardType: TextInputType.name,
      controller: controller,
    ):IntlPhoneField(
      initialValue: '+963',
      disableLengthCheck: true,
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: onNumberChanged,
      keyboardType: TextInputType.phone,
      cursorColor: Color1.primaryColor,
      decoration:  InputDecoration(
        hintText: text,
        hintStyle: Style.textStyle18,
        enabledBorder: const UnderlineInputBorder(
          borderSide:
          BorderSide(color: Color1.primaryColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:
          BorderSide(color: Color1.primaryColor),
        ),
      ),
    );
  }
}
