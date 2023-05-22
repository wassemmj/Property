import 'package:flutter/material.dart';
import 'package:property_app/views/addPropertyView/add_property_view.dart';
import 'package:property_app/views/awidget/drawer_widget.dart';
import 'package:property_app/views/loginView/login_view.dart';
import 'package:property_app/views/myPropertyView/my_property_view.dart';
import 'package:property_app/views/waitingView/waiting_view.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerWidget(text: 'Profile', icon: Icons.person, onTap: (){}),
            DrawerWidget(text: 'add Property', icon: Icons.add, onTap: () => add(context)),
            DrawerWidget(text: 'waiting room', icon: Icons.access_time_outlined, onTap: () => waiting(context)),
            DrawerWidget(text: 'my property', icon: Icons.home_outlined, onTap: ()=> myProperty(context)),
            DrawerWidget(text: 'subscription', icon: Icons.money_outlined, onTap: () {}),
            const SizedBox(
              height: 430,
            ),
            DrawerWidget(text: 'Log out', icon: Icons.logout, onTap: ()=>logout(context)),
          ],
        ),
      ),
    );
  }

  logout(context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LoginView()));
  }

  waiting(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WaitingView()));
  }

  add(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddPropertyView()));
  }

  myProperty(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyPropertyView()));
  }
}
