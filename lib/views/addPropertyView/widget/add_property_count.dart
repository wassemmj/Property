import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class AddPropertyCount extends StatelessWidget {
  const AddPropertyCount({Key? key, required this.text, required this.number, required this.onPressed1, required this.onPressed2}) : super(key: key);

  final String text;
  final int number;
  final void  Function() onPressed1;
  final  void Function() onPressed2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Style.textStyle20,
        ),
        Row(
          children: [
            IconButton(
              onPressed: onPressed2,
              icon: const Icon(
                Icons.remove,
                color: Color1.primaryColor,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$number',
              style: Style.textStyle22
                  .copyWith(color: Color1.black.withOpacity(0.9)),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: onPressed1,
              icon: const Icon(
                Icons.add,
                color: Color1.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
