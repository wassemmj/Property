import 'package:flutter/material.dart';

import '../../../Core/style.dart';

class AddPropertyCheckBox extends StatelessWidget {
  const AddPropertyCheckBox({Key? key, required this.text, required this.value, required this.onPressed, required this.color}) : super(key: key);

  final String text;
  final bool value;
  final Color color;
  final Function(bool? val) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Style.textStyle20.copyWith(color: color,fontWeight: FontWeight.w400),
        ),
        Checkbox(
          value: value,
          onChanged: onPressed,
        )
      ],
    );
  }
}
