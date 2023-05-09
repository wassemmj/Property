import 'package:flutter/material.dart';

class ShowMoreImage extends StatelessWidget {
  const ShowMoreImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
        // borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/apartment.jpg'),
        ),
      ),
    );
  }
}
