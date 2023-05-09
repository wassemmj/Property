import 'package:flutter/material.dart';
import 'package:property_app/views/exploreView/widget/explore_first_Item.dart';
import 'package:property_app/views/exploreView/widget/explore_last_item.dart';
import 'package:property_app/views/showMoreView/show_more_view.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore'.toUpperCase(),
          style: Style.textStyle22,
        ),
        backgroundColor: Color1.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Apartments',
                  style: TextStyle(color: Color1.primaryColor, fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 4) {
                        return const ExploreLastItem();
                      }
                      return const ExploreFirstItem();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
