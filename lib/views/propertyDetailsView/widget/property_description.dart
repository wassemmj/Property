import 'package:flutter/material.dart';
import 'package:property_app/Core/style.dart';

import '../../../Core/color1.dart';

class PropertyDescription extends StatelessWidget {
  const PropertyDescription({Key? key, required this.text, required this.number, required this.icon}) : super(key: key);
  final String text;
  final int number;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.all(8),
        width: 170,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 30,
              color: Color1.white,
            ),
            Text(
              text,
              style: Style.textStyle20.copyWith(color: Color1.white),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color1.white),
              child: Center(
                child: Text(
                  '$number',
                  style: Style.textStyle18.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
