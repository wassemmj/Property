import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        image: const DecorationImage(
          image: AssetImage('assets/images/logo.jpg'),
        ),
      ),
    );
  }
}
