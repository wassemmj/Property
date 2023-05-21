import 'package:flutter/material.dart';
import 'package:property_app/Home_View/Widget/Home_View_body.dart';
class Home_View extends StatelessWidget {
  const Home_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Home_View_Body(),debugShowCheckedModeBanner: false, );
  }
}
