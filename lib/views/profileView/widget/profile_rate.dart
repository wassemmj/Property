import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class ProfileRate extends StatelessWidget {
  const ProfileRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text(
            'Rate :',
            style: Style.textStyle22.copyWith(
                fontWeight: FontWeight.w400,
                color: Color1.primaryColor),
          ),
          const SizedBox(
            width: 30,
          ),
          Row(
            children: [
              const Icon(
                Icons.star_rate,
                color: Colors.yellow,
              ),
              Text(
                '4.8 / 5',
                style: Style.textStyle18.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Color1.black),
              ),
            ],
          ),
        ],
      );
  }
}
