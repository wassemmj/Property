import 'package:flutter/material.dart';

class ShowMoreText1 extends StatelessWidget {
  const ShowMoreText1({Key? key, required this.text, required this.style}) : super(key: key);

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
