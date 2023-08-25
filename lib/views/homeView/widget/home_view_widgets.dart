import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/core/style.dart';
import 'package:property_app/logic/home_cubit/home_cubit.dart';
import 'package:property_app/views/awidget/main_drawer.dart';
import 'package:property_app/views/wallet_view/wallet_view.dart';

import '../../../Core/color1.dart';
import '../../../logic/report_advert_cubit/report_advert_cubit.dart';
import '../../PropertyDetailsView/property_details_view.dart';
import '../../profileView/profile_view.dart';
import '../../propertyDetailsView/widget/property_owner.dart';

class HomeViewWidgets extends StatefulWidget {
  const HomeViewWidgets({Key? key}) : super(key: key);

  @override
  State<HomeViewWidgets> createState() => _HomeViewWidgetsState();
}

class _HomeViewWidgetsState extends State<HomeViewWidgets> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<HomeCubit>(context, listen: false).get();
    });
    super.initState();
  }

  var m = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    int width = MediaQuery.of(context).size.width.toInt();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color1.primaryColor),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: const Icon(Icons.search_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WalletView(),));
            },
            icon: const Icon(Icons.wallet),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading ||
              state.status == HomeStatus.initial) {
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
          if (BlocProvider.of<HomeCubit>(context).top == null||BlocProvider.of<HomeCubit>(context).random == null) {
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
          var l = BlocProvider.of<HomeCubit>(context).top;
          var ll = BlocProvider.of<HomeCubit>(context).random;
          return SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 86.toInt(),
                      ),
                      Text(
                        'Our Promise',
                        style:
                        Style.textStyle16.copyWith(color: Color1.primaryColor),
                      ),
                      SizedBox(
                        height: height / 57.toInt(),
                      ),
                      Text('The perfect choice for ',
                          style: Style.textStyle22.copyWith(
                              fontSize: (height / 36).floorToDouble(),
                              fontWeight: FontWeight.w500,
                              color: Color1.black)),
                      Text('The future ',
                          style: Style.textStyle22.copyWith(
                              fontSize: (height / 36).floorToDouble(),
                              fontWeight: FontWeight.w500,
                              color: Color1.black)),
                      SizedBox(
                        height: height / 57.toInt(),
                      ),
                      Container(
                        height: height / 3.toInt(),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(
                              'assets/images/perspective-d-render-building-wireframe-vector-wireframe-city-background-image-building-perspective-d-render-112176156.jpg',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 28.toInt(),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Top Seller',
                          style: Style.textStyle20
                              .copyWith(color: Color1.primaryColor),
                        ),
                      ),
                      SizedBox(height: height / 86.toInt()),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: l.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PropertyOwner(
                          id: l[index]['id'],
                          name: l[index]['name'],
                          email: l[index]['email'],
                          phone: l[index]['phone_number'] ?? 'No Phone Number',
                          f: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Report a User',
                                                    style: Style
                                                        .textStyle20
                                                        .copyWith(
                                                        color: Color1
                                                            .primaryColor),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text(
                                                        'cancel',
                                                        style: Style
                                                            .textStyle16
                                                            .copyWith(
                                                          fontSize: 14,
                                                          color: Color1
                                                              .primaryColor
                                                              .withOpacity(
                                                              .7),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(
                                                            context)
                                                            .pop();
                                                      },
                                                    ),
                                                    BlocBuilder<
                                                        ReportAdvertCubit,
                                                        ReportAdvertState>(
                                                      builder: (context,
                                                          state) {
                                                        return TextButton(
                                                          child: Text(
                                                            'Approve',
                                                            style: Style
                                                                .textStyle16
                                                                .copyWith(
                                                              fontSize:
                                                              14,
                                                              color: Color1
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                  .7),
                                                            ),
                                                          ),
                                                          onPressed:
                                                              () async {
                                                            if (m.text
                                                                .isNotEmpty) {
                                                              await BlocProvider.of<ReportAdvertCubit>(
                                                                  context)
                                                                  .proU(
                                                                  l[index]['id'],
                                                                  m.text);
                                                              if (state
                                                                  .status ==
                                                                  ReportAdvertStatus
                                                                      .success) {
                                                                Navigator.of(
                                                                    context)
                                                                    .pop();
                                                                Navigator.of(
                                                                    context)
                                                                    .pop();
                                                                ScaffoldMessenger.of(
                                                                    context)
                                                                    .showSnackBar(
                                                                  const SnackBar(
                                                                      content:
                                                                      Text('report successfully')),
                                                                );
                                                              }
                                                            } else {
                                                              ScaffoldMessenger.of(
                                                                  context)
                                                                  .showSnackBar(
                                                                const SnackBar(
                                                                    content:
                                                                    Text('this filled is required')),
                                                              );
                                                            }
                                                          },
                                                        );
                                                      },
                                                    )
                                                  ],
                                                  content: Container(
                                                    child: TextFormField(
                                                      decoration:
                                                      const InputDecoration(
                                                        hintText:
                                                        'Write why..',
                                                        focusedBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color1
                                                                    .primaryColor,
                                                                width:
                                                                1)),
                                                      ),
                                                      controller: m,
                                                      maxLength: 100,
                                                      maxLines: 3,
                                                      cursorColor: Color1
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons
                                                    .report_gmailerrorred_sharp,
                                                color:
                                                Color1.primaryColor,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Report the User',
                                                style: Style.textStyle20,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Divider(),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileView(
                                                      id: l[index]['id'],
                                                      home: false),
                                            ));
                                          },
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.person,
                                                color:
                                                Color1.primaryColor,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'show profile',
                                                style: Style.textStyle20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          color: Colors.black26,
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Random Property',
                          style: Style.textStyle20
                              .copyWith(color: Color1.primaryColor),
                        ),
                      ),
                      SizedBox(height: height / 86.toInt()),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var ad = ll[index]['advert'];
                        var cat = ll[index]['category'];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => PropertyDetailsView(id: ll[index]['id'])));
                            },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black12,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ll[index]['building_name'] + ', ${ll[index]['space']} m²',
                                      style: Style.textStyle20
                                          .copyWith(color: Color1.black.withOpacity(.6)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${ad['advertable_type'].toString().substring(11)} , ${ad['advertable_type'] == "App\\Models\\purchase" ? ad['advertable']['total_price']  : ad['advertable']['price_per_day'] } \$ price',
                                      style: Style.textStyle18
                                          .copyWith(color: Color1.black.withOpacity(.6)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      cat['name'] + ', ' + cat['type'],
                                      style: Style.textStyle18
                                          .copyWith(color: Color1.black.withOpacity(.6)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      drawer: const MainDrawer(),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResult = ['ke', 'wassem','obada','nour'];

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        })
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  Widget buildResults(BuildContext context) {
    return Result(
      query: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResult.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }
}

class Result extends StatefulWidget {
  const Result({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List li = [];
  var m = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<HomeCubit>(context, listen: false)
          .search(widget.query);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
        if ((state.status == HomeStatus.loading ||
            state.status == HomeStatus.initial)) {
          return const Center(
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
        }

        if(BlocProvider.of<HomeCubit>(context).searchList==null) {
          return const Center(
              child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
        }
        li = BlocProvider.of<HomeCubit>(context).searchList;
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: li.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return PropertyOwner(
                id: li[index]['id'],
                name: li[index]['name'],
                email: li[index]['email'],
                phone: li[index]['phone_number'] ?? 'No Phone Number',
                f: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Report a User',
                                          style: Style
                                              .textStyle20
                                              .copyWith(
                                              color: Color1
                                                  .primaryColor),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text(
                                              'cancel',
                                              style: Style
                                                  .textStyle16
                                                  .copyWith(
                                                fontSize: 14,
                                                color: Color1
                                                    .primaryColor
                                                    .withOpacity(
                                                    .7),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(
                                                  context)
                                                  .pop();
                                            },
                                          ),
                                          BlocBuilder<
                                              ReportAdvertCubit,
                                              ReportAdvertState>(
                                            builder: (context,
                                                state) {
                                              return TextButton(
                                                child: Text(
                                                  'Approve',
                                                  style: Style
                                                      .textStyle16
                                                      .copyWith(
                                                    fontSize:
                                                    14,
                                                    color: Color1
                                                        .primaryColor
                                                        .withOpacity(
                                                        .7),
                                                  ),
                                                ),
                                                onPressed:
                                                    () async {
                                                  if (m.text
                                                      .isNotEmpty) {
                                                    await BlocProvider.of<ReportAdvertCubit>(
                                                        context)
                                                        .proU(
                                                        li[index]['id'],
                                                        m.text);
                                                    if (state
                                                        .status ==
                                                        ReportAdvertStatus
                                                            .success) {
                                                      Navigator.of(
                                                          context)
                                                          .pop();
                                                      Navigator.of(
                                                          context)
                                                          .pop();
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                            content:
                                                            Text('report successfully')),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                        context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                          content:
                                                          Text('this filled is required')),
                                                    );
                                                  }
                                                },
                                              );
                                            },
                                          )
                                        ],
                                        content: Container(
                                          child: TextFormField(
                                            decoration:
                                            const InputDecoration(
                                              hintText:
                                              'Write why..',
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color1
                                                          .primaryColor,
                                                      width:
                                                      1)),
                                            ),
                                            controller: m,
                                            maxLength: 100,
                                            maxLines: 3,
                                            cursorColor: Color1
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons
                                          .report_gmailerrorred_sharp,
                                      color:
                                      Color1.primaryColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Report the User',
                                      style: Style.textStyle20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileView(
                                            id: li[index]['id'],
                                            home: false),
                                  ));
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.person,
                                      color:
                                      Color1.primaryColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'show profile',
                                      style: Style.textStyle20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                color: Colors.black26,
              );
            },
          ),
        );
      },
    );
  }
}


/*
Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ShowMoreView()));
                    },
                    child: const HomeContainers(
                      text: 'Home',
                      imagePath: 'assets/images/img_8.png',
                    ),
                  ),
                  SizedBox(
                    width: (width~/41).toDouble(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ShowMoreView()));
                    },
                    child: const HomeContainers(
                      text: 'Villa',
                      imagePath: 'assets/images/img_10.png',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height/57.toInt(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ShowMoreView()));
                    },
                    child: const HomeContainers(
                      text: 'Apartment',
                      imagePath: 'assets/images/img_5.png',
                    ),
                  ),
                  SizedBox(
                    width: (width~/41).toDouble(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ExploreView(from: true)));
                    },
                    child: const HomeContainers(
                      text: 'Others',
                      imagePath: 'assets/images/img_11.png',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height/57.toInt(),
              ),
 */
