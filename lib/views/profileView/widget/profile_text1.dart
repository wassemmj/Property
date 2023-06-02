import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class ProfileText1 extends StatelessWidget {
  const ProfileText1({Key? key, required this.text, required this.ans})
      : super(key: key);

  final String text;
  final String ans;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Style.textStyle22.copyWith(
              fontWeight: FontWeight.w400, color: Color1.primaryColor),
        ),
        const SizedBox(width: 15),
        Text(
          ans,
          style: Style.textStyle18.copyWith(
            fontWeight: FontWeight.w300,
            color: Color1.black,
          ),
        ),
      ],
    );
  }
}
