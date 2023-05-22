import 'package:flutter/material.dart';

import '../../../Core/color1.dart';

class HomeContainers extends StatelessWidget {
  const HomeContainers({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth / 2.6,
      height: screenHeight / 9.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(80, 82, 82, 0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              text,
              style: const TextStyle(
                  color: Color1.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
              ),
            ),
          ),
          Container(
            height: screenHeight / 5.4,
            width: screenWidth / 5.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  imagePath,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}