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
          style: Style.textStyle18.copyWith(
              fontWeight: FontWeight.w400, color: Color1.primaryColor),
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 27.4),
        Text(
          ans,
          style: !(ans.length>65)? Style.textStyle18.copyWith(
            fontWeight: FontWeight.w300,
            color: Color1.black,
            fontSize:  15
          ):Style.textStyle18.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 18,
            color: Color1.black,
          ),
        ),
      ],
    );
  }
}
