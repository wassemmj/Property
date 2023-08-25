import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/state.dart';
import 'package:property_app/logic/login_cubit/login_cubit.dart';
import 'package:property_app/views/addPropertyView/add_property_view.dart';
import 'package:property_app/views/awidget/drawer_widget.dart';
import 'package:property_app/views/filterView/filter_view.dart';
import 'package:property_app/views/follow_view/follow_view.dart';
import 'package:property_app/views/goldCharts/gold_charts.dart';
import 'package:property_app/views/loginView/login_view.dart';
import 'package:property_app/views/priceView/price_view.dart';
import 'package:property_app/views/pubView/pub_view.dart';
import 'package:property_app/views/subscriptionView/subscription_view.dart';
import 'package:property_app/views/waitingView/waiting_view.dart';

import '../silverCharts/silver_charts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerWidget(
                text: 'Filter',
                icon: Icons.filter_alt_rounded,
                onTap: () => filter(context)),
            DrawerWidget(
                text: 'add Property',
                icon: Icons.add,
                onTap: () => add(context)),
            DrawerWidget(
                text: 'waiting room',
                icon: Icons.access_time_outlined,
                onTap: () => waiting(context)),
            DrawerWidget(
                text: 'requests',
                icon: Icons.request_page_outlined,
                onTap: () => waiting1(context)),
            Statee.id != 1
                ? DrawerWidget(
                    text: 'analyzer',
                    icon: Icons.analytics_outlined,
                    onTap: () {
                      if (Statee.id == 2) {
                        myProperty(context);
                      } else {
                        myProperty1(context);
                      }
                    })
                : Container(),
            DrawerWidget(
                text: 'price property',
                icon: Icons.monetization_on_outlined,
                onTap: () => price(context)),
            DrawerWidget(
                text: 'subscription',
                icon: Icons.money_outlined,
                onTap: () => subscription(context)),
            DrawerWidget(
                text: 'follower', icon: Icons.people, onTap: () => f(context)),
            Statee.id != 1
                ? const SizedBox(height: 255)
                : const SizedBox(height: 305),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if(state.status == LoginStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('logout successfully')));
                }
              },
              child: DrawerWidget(
                  text: 'Log out',
                  icon: Icons.logout,
                  onTap: () => logout(context)),
            ),
          ],
        ),
      ),
    );
  }

  f(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const FollowView()));
  }

  logout(context) async {
    await BlocProvider.of<LoginCubit>(context).postLogout();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const LoginView()));
  }

  subscription(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const SubscriptionView()));
  }

  filter(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const FilterView()));
  }

  waiting(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const WaitingView()));
  }

  waiting1(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const PubView()));
  }

  add(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const AddPropertyView()));
  }

  myProperty(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const SilverCharts()));
  }

  myProperty1(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const GoldCharts()));
  }

  price(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const PriceView()));
  }
}
