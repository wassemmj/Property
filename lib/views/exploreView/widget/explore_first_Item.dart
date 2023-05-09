import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class ExploreFirstItem extends StatelessWidget {
  const ExploreFirstItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: 200,
              height: 150,
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                      'assets/images/apartment.jpg'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Color1.primaryColor.withOpacity(0.2)),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25))),
              padding: const EdgeInsets.only(top: 10),
              child: const Text(
                'fn 15',
                textAlign: TextAlign.center,
                style: Style.textStyle18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
