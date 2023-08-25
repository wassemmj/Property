import 'package:flutter/material.dart';

import '../Core/color1.dart';
import 'loginView/login_view.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    navigateHome();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color1.primaryColor.withOpacity(.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            const CircularProgressIndicator(color: Color1.white,strokeWidth: 1,),
          ],
        ),
      ),
    );
  }

  void navigateHome() {
    Future.delayed(
      const Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginView(),)),
    );
  }
}


/*

 */