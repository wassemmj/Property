import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class ProfileText2 extends StatelessWidget {
  const ProfileText2({Key? key, required this.text, required this.ans}) : super(key: key);

  final String text;
  final String ans;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Style.textStyle22.copyWith(
              fontWeight: FontWeight.w400,
              color: Color1.primaryColor,
          ),
        ),
        const SizedBox(width: 15),
        Flexible(
          child: Text(
            ans,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: Style.textStyle16.copyWith(
                fontWeight: FontWeight.w300,
                color: Color1.black,
            ),
          ),
        ),
      ],
    );
  }
}
