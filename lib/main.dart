import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/Home_View/Widget/Home_View.dart';

import 'package:property_app/logic/login_cubit/login_cubit.dart';
import 'package:property_app/views/PropertyDetailsView/Widget/Property_View_Details_body.dart';
import 'package:property_app/views/loginView/login_view.dart';

import 'Core/color1.dart';
import 'views/PropertyDetailsView/Widget/Property_Details_View.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Color1.white,
        // primarySwatch: Color1.primaryColor,
      ),
      home:  const LoginView(),
    );
  }
}
