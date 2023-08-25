import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/logic/favorite_cubit/favorite_cubit.dart';
import 'package:property_app/views/exploreView/explore_view.dart';

import '../../Core/color1.dart';
import '../PropertyDetailsView/property_details_view.dart';

class FavView extends StatefulWidget {
  const FavView({Key? key}) : super(key: key);

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  List fav = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<FavoriteCubit>(context, listen: false).getFav();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    int width = MediaQuery.of(context).size.width.toInt();
    return Scaffold(
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state.status == FavoriteStatus.loading ||
              state.status == FavoriteStatus.initial) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                const Center(
                    child: CircularProgressIndicator(
                  color: Color1.primaryColor,
                  strokeWidth: 1,
                )),
              ],
            );
          }
          if (BlocProvider.of<FavoriteCubit>(context).fav == null) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                const Center(
                    child: CircularProgressIndicator(
                  color: Color1.primaryColor,
                  strokeWidth: 1,
                )),
              ],
            );
          }
          fav = BlocProvider.of<FavoriteCubit>(context).fav;
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'Favorite Property',
                    style: Style.textStyle22.copyWith(
                        fontSize: (height / 34.3).floorToDouble(),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                fav.isNotEmpty
                    ? Container()
                    : SizedBox(
                        height: (height / 2.477).floorToDouble(),
                      ),
                fav.isNotEmpty
                    ? Flexible(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: ListView.builder(
                              itemCount: fav.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var ll = fav[index];
                                var p = ll['advertable'];
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (_) => PropertyDetailsView(id: ll['id'])));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black26,
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${ll['advertable_type'].toString().substring(11)} , ${ll['advertable_type'] == "App\\Models\\purchase" ? ll['advertable']['total_price']  : ll['advertable']['price_per_day'] } \$ price',
                                              style: Style.textStyle20
                                                  .copyWith(color: Color1.white),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'about property ',
                                              style: Style.textStyle18
                                                  .copyWith(color: Color1.primaryColor,fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );

                              }),
                        ),
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
          );
        },
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

/*
return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => PropertyDetailsView(
                                            id: ll['property_id'])));
                                  },
                                  child: Stack(children: [
                                    Container(
                                      height: (height / 3.6).floorToDouble(),
                                      margin: const EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Stack(
                                              children: const [
                                                ShowMoreImage(),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color1.primaryColor
                                                          .withOpacity(0.2)),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  25))),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      ShowMoreRow(
                                                        icon: Icons
                                                            .monetization_on_outlined,
                                                        color:
                                                            const Color.fromRGBO(80, 82, 82, 0.7),
                                                        text: ll['advertable_type'] ==
                                                                'App\\Models\\Rent'
                                                            ? '${p['price_per_day']} per day'
                                                            : '${p['total_price']} ',
                                                        size: (height / 48)
                                                            .floorToDouble(),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                );
 */