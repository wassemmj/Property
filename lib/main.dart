import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/logic/all_property_cubit/all_property_cubit.dart';

import 'package:property_app/logic/login_cubit/login_cubit.dart';
import 'package:property_app/logic/report_advert_cubit/report_advert_cubit.dart';
import 'package:property_app/logic/request_cubit/request_cubit.dart';
import 'package:property_app/views/loginView/login_view.dart';

import 'Core/color1.dart';
import 'logic/create_property_cubit/create_property_cubit.dart';
import 'logic/detail_cubit/detail_cubit.dart';
import 'logic/profile_cubit/profile_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginCubit(),
        ),
        BlocProvider(
          create: (_) => AllPropertyCubit(),
        ),
        BlocProvider(
          create: (_) => CreatePropertyCubit(),
        ),
        BlocProvider(
          create: (_) => DetailCubit(),
        ),
        BlocProvider(
          create: (_) => ProfileCubit(),
        ),
        BlocProvider(
          create: (_) => ReportAdvertCubit(),
        ),
        BlocProvider(
          create: (_) => RequestCubit(),
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
        // primarySwatch: Colors.blue,
      ),
      home:  const LoginView(),
    );
  }
}
