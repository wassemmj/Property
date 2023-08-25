import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class PropertyOwner extends StatelessWidget {
  const PropertyOwner({Key? key, required this.id, required this.name, required this.email, required this.phone, required this.f, required this.color}) : super(key: key);

  final int id;
  final String name;
  final String email;
  final String phone;
  final Color color;
  final Function() f;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: f,
      child: Container(
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Row(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                  size: const Size.fromRadius(40),
                  child: Image.asset(
                    'assets/images/i.png',
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Style.textStyle20
                      .copyWith(color: Color1.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  email,
                  style: Style.textStyle16
                      .copyWith(color: Color1.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  phone,
                  style: Style.textStyle18
                      .copyWith(color: Color1.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
