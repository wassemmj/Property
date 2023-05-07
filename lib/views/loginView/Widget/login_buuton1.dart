import 'package:flutter/material.dart';

import '../../../Core/color1.dart';

class LoginButton1 extends StatelessWidget {
  const LoginButton1({Key? key, required this.formKey, required this.index, required this.onPressed})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final int index;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
        foregroundColor: MaterialStateProperty.all(Color1.white),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      child: Text(
        index == 1 ? 'Log in'.toUpperCase() : 'Log in'.toUpperCase(),
      ),
    );
  }
}
