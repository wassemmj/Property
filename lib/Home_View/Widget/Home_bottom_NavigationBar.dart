import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:property_app/Home_View/Widget/Home_View_Widgets.dart';
import 'package:line_icons/line_icons.dart';

import '../../views/PropertyDetailsView/Widget/Property_Details_View.dart';
// class BottomNavigationBarExample extends StatefulWidget {
class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Home_View_Widgets(),

      bottomNavigationBar: Container(
        

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.blueAccent.withOpacity(.3),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
curve:Curves.linear,

            textSize: 26,
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.blueAccent,

            iconSize: 26,
            style: GnavStyle.google,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Color.fromRGBO(80, 82, 82, 0.05),
            color: Colors.black,
            tabs:const  [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.filter_1_outlined,
                text: 'Fliter',
              ),
              GButton(
                icon:Icons.settings_outlined,
                text: 'Settings',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                if(_selectedIndex==1){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Proberty_Details_View()));}
              });
            },
          ),
        ),
      ),
    );
  }
}