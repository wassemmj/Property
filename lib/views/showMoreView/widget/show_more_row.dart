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
    return Row(
      children: [
        Icon(
          icon,
          size: size,
          color: color,
        ),
        const SizedBox(width: 2),
        ShowMoreText1(text: text, style: Style.textStyle16),
      ],
    );
  }
}
