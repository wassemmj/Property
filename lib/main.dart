import 'package:flutter/material.dart';

import 'Core/color1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Color1.primaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}