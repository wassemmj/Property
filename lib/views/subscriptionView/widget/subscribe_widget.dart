import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class SubscribeWidget extends StatelessWidget {
  const SubscribeWidget(
      {Key? key, required this.value, required this.onChanged, required this.text})
      : super(key: key);

  final String text;
  final bool value;
  final Function(bool? val) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Style.textStyle20,
          ),
          Checkbox(
            value: value,
            activeColor: Color1.primaryColor,
            shape: const CircleBorder(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
