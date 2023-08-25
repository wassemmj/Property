import 'package:flutter/material.dart';
import 'package:property_app/views/showMoreView/widget/show_more_text1.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class ShowMoreRow extends StatelessWidget {
  const ShowMoreRow({Key? key, required this.icon, required this.color, required this.text, required this.size}) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();
    return Row(
      children: [
        Icon(
          icon,
          size: size,
          color: color,
        ),
        SizedBox(width: (width/137).floorToDouble()),
        ShowMoreText1(text: text, style: text.length>16? Style.textStyle16.copyWith(fontSize: 12):Style.textStyle16),
      ],
    );
  }
}
