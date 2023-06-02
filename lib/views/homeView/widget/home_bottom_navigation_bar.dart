import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/views/exploreView/explore_view.dart';
import '../../favView/fav_view.dart';
import '../../profileView/profile_view.dart';
import 'home_view_widgets.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int _selectedIndex = 0;
  var _tabs = [];

  @override
  Widget build(BuildContext context) {
    _tabs = [
      {
        'body': const HomeViewWidgets(),
      },
      {
        'body': const ExploreView(
          from: false,
        ),
      },
      {
        'body': const FavView()
      },
      {
        'body': const ProfileView(),
      },
    ];
    return Scaffold(
      body: _tabs[_selectedIndex]['body'] as Widget,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          color: Color1.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color1.primaryColor.withOpacity(.3),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            curve: Curves.linear,
            textSize: 26,
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Color1.primaryColor,
            iconSize: 26,
            style: GnavStyle.google,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: const Color.fromRGBO(80, 82, 82, 0.05),
            color: Color1.black,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.explore,
                text: 'Explore',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favorite',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
