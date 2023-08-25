// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/logic/all_property_cubit/all_property_cubit.dart';
import 'package:property_app/logic/favorite_cubit/favorite_cubit.dart';
import 'package:property_app/logic/filter_cubit/filter_cubit.dart';
import 'package:property_app/logic/home_cubit/home_cubit.dart';

import 'package:property_app/logic/login_cubit/login_cubit.dart';
import 'package:property_app/logic/property_image_cubit/property_image_cubit.dart';
import 'package:property_app/logic/report_advert_cubit/report_advert_cubit.dart';
import 'package:property_app/logic/request_cubit/request_cubit.dart';
import 'package:property_app/logic/subscribe_cubit/subscribe_cubit.dart';
import 'package:property_app/views/loginView/login_view.dart';
import 'package:property_app/views/splash.dart';

import 'Core/color1.dart';
import 'logic/chart_cubit/chart_cubit.dart';
import 'logic/create_property_cubit/create_property_cubit.dart';
import 'logic/detail_cubit/detail_cubit.dart';
import 'logic/location_cubit/location_cubit.dart';
import 'logic/price_cubit/price_cubit.dart';
import 'logic/profile_cubit/profile_cubit.dart';
import 'logic/wallet_cubit/wallet_cubit.dart';

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
          create: (_) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (_) => RequestCubit(),
        ),
        BlocProvider(
          create: (_) => LocationCubit(),
        ),
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        BlocProvider(
          create: (_) => SubscribeCubit(),
        ),
        BlocProvider(
          create: (_) => WalletCubit(),
        ),
        BlocProvider(
          create: (_) => FilterCubit(),
        ),
        BlocProvider(
          create: (_) => ChartCubit(),
        ),
        BlocProvider(
          create: (_) => PriceCubit(),
        ),
        BlocProvider(
          create: (_) => PropertyImageCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Color1.white,
        // primarySwatch: Colors.blue,
      ),
      home:  const Splash(),
    );
  }
}
