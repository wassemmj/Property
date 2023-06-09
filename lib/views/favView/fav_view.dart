import 'package:flutter/material.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/views/exploreView/explore_view.dart';
import 'package:property_app/views/showMoreView/widget/show_more_card.dart';

import '../../Core/color1.dart';

class FavView extends StatefulWidget {
  const FavView({Key? key}) : super(key: key);

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  List fav = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                'Favorite Property',
                style: Style.textStyle22
                    .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            fav.isNotEmpty
                ? Container()
                : const SizedBox(
                    height: 350,
                  ),
            fav.isNotEmpty
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const ShowMoreCard();
                        }),
                  )
                : const Center(
                    child: Text(
                      'There is not any favorites properties,\n Add Some Property',
                      textAlign: TextAlign.center,
                      style: Style.textStyle16,
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: fav.isEmpty
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const ExploreView(from: true),
                ));
              },
              tooltip: 'add some fav property',
              backgroundColor: Color1.primaryColor.withOpacity(0.7),
              child: const Icon(
                Icons.favorite_border,
                color: Color1.white,
              ),
            )
          : null,
    );
  }
}
