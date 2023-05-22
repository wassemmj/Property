import 'package:flutter/material.dart';

import '../../../Core/style.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.fn,
    required this.text,
    required this.roundedRectangleBorder,
    required this.bacColor,
    required this.forColor,
  }) : super(key: key);

  final Function() fn;
  final String text;
  final RoundedRectangleBorder roundedRectangleBorder;
  final Color bacColor;
  final Color forColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fn,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bacColor),
        foregroundColor: MaterialStateProperty.all(forColor),
        padding: MaterialStateProperty.all(const EdgeInsets.all(7.5)),
        shape: MaterialStateProperty.all(
          roundedRectangleBorder,
        ),
      ),
      child: Text(
        text.toUpperCase(),
        style: Style.textStyle12,
      ),
    );
  }
}
