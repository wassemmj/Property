import 'package:flutter/material.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.text, required this.icon, required this.onTap}) : super(key: key);

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Style.textStyle18.copyWith(
                color: Color1.black,
                fontWeight: FontWeight.w200
              ),
            ),
            Icon(
              icon,
              size: 25,
              color: Color1.primaryColor.withOpacity(1),
            )
          ],
        ),
      ),
    );
  }
}
