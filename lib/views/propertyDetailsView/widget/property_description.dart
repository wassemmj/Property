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
    return Container(
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.all(8),
      width: number==0 ? text.length > 16 ? 160:150:text.length > 16 ? 188: 183,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          number!=0 ? Icon(
            icon,
            size: 30,
            color: Color1.white,
          ):Container(),
          Text(
            text,
            style: text.length > 16 ? Style.textStyle16.copyWith(color: Color1.white):Style.textStyle18.copyWith(color: Color1.white),
          ),
          number!=0 ? Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Color1.white),
            child: Center(
              child: Text(
                '$number',
                textAlign: TextAlign.center,
                style: number.bitLength>3 ? Style.textStyle16.copyWith(fontWeight: FontWeight.w400,fontSize: 12):Style.textStyle16.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ):Container(),
        ],
      ),
    );
  }
}
