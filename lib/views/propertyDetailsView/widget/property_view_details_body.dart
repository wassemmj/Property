import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/logic/all_property_cubit/all_property_cubit.dart';
import 'package:property_app/logic/detail_cubit/detail_cubit.dart';
import 'package:property_app/logic/favorite_cubit/favorite_cubit.dart';
import 'package:property_app/logic/property_image_cubit/property_image_cubit.dart';
import 'package:property_app/logic/report_advert_cubit/report_advert_cubit.dart';
import 'package:property_app/views/PropertyDetailsView/Widget/property_description.dart';
import 'package:property_app/views/profileView/profile_view.dart';
import 'package:property_app/views/propertyDetailsView/widget/property_owner.dart';
import 'package:property_app/views/reportView/report_view.dart';

import '../../../Core/api.dart';
import '../../../logic/request_cubit/request_cubit.dart';

class PropertyDetailsViewBody extends StatefulWidget {
  const PropertyDetailsViewBody({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<PropertyDetailsViewBody> createState() =>
      _PropertyDetailsViewBodyState();
}

class _PropertyDetailsViewBodyState extends State<PropertyDetailsViewBody> {
  bool fav = false;
  int aId = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<DetailCubit>(context, listen: false)
          .detail(widget.id);
      await BlocProvider.of<PropertyImageCubit>(context, listen: false)
          .getImage(widget.id);
      aId = BlocProvider.of<DetailCubit>(context, listen: false).pro['advert']
          ['id'];
    });
    super.initState();
    getd();
  }

  getd() async {
    await BlocProvider.of<FavoriteCubit>(context).getFav();
    fav = BlocProvider.of<FavoriteCubit>(context).fav.any((expert) {
      print(expert['id']);
      return widget.id == expert['id'];
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await BlocProvider.of<FavoriteCubit>(context).getFav();
    // fav =  Provider.of<ApiProvider>(context, listen: false).isMealFavorites(id);
    if (fav) {
      setState(() {
        fav = true;
      });
    } else {
      setState(() {
        fav = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int id;
    var m = TextEditingController();
    return SingleChildScrollView(
      child: SafeArea(
        child: BlocBuilder<DetailCubit, DetailState>(
          builder: (context, state) {
            if (state.status == DetailStatus.loading ||
                state.status == DetailStatus.initial) {
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
            } else if (state.status == PropertyImageStatus.loading ||
                state.status == PropertyImageStatus.initial) {
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
            } else {
              var ll = BlocProvider.of<DetailCubit>(context).pro;
              var image = BlocProvider.of<PropertyImageCubit>(context).image;
              var sec = ll['property_security_model'];
              var lux = ll['property_luxury_model'];
              var sup = ll['property_supply'];
              var ind = ll['property_industrial_support'];
              var heat = ll['property__heat_model'];
              var po = ll['user'];
              id = ll['id'];
              aId = ll['advert']['id'];
              var a = ll['advert']['advertable'];
              var price =
                  ll['advert']['advertable_type'] == "App\\Models\\purchase"
                      ? a['total_price']
                      : a['price_per_day'];
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: BlocProvider.of<PropertyImageCubit>(context).image==null || image.isEmpty
                          ? const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/img_1.png',
                              ),
                            )
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                '${Api.apiServer.substring(0, 23)}/${image[0]['imageData'].substring(63)}',
                              ),
                            ),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Color1.primaryColor,
                                    size: 28,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Row(
                                  children: [
                                    BlocBuilder<FavoriteCubit, FavoriteState>(
                                      builder: (context, state) {
                                        return IconButton(
                                          icon: Icon(
                                            fav
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.red,
                                            size: 28,
                                          ),
                                          onPressed: () async {
                                            if (!fav) {
                                              await BlocProvider.of<
                                                      FavoriteCubit>(context)
                                                  .addFav(aId);
                                            } else {
                                              await BlocProvider.of<
                                                      FavoriteCubit>(context)
                                                  .delFav(aId);
                                            }
                                            setState(() {
                                              fav = !fav;
                                            });
                                          },
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.report_gmailerrorred_sharp,
                                        color: Color.fromRGBO(80, 82, 82, 0.7),
                                        size: 28,
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Report an Advert',
                                                style: Style.textStyle20
                                                    .copyWith(
                                                        color: Color1
                                                            .primaryColor),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text(
                                                    'cancel',
                                                    style: Style.textStyle16
                                                        .copyWith(
                                                      fontSize: 14,
                                                      color: Color1.primaryColor
                                                          .withOpacity(.7),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                BlocBuilder<ReportAdvertCubit,
                                                    ReportAdvertState>(
                                                  builder: (context, state) {
                                                    return TextButton(
                                                      child: Text(
                                                        'Approve',
                                                        style: Style.textStyle16
                                                            .copyWith(
                                                          fontSize: 14,
                                                          color: Color1
                                                              .primaryColor
                                                              .withOpacity(.7),
                                                        ),
                                                      ),
                                                      onPressed: () async {
                                                        if (m.text.isNotEmpty) {
                                                          await BlocProvider.of<
                                                                      ReportAdvertCubit>(
                                                                  context)
                                                              .pro(aId, m.text);
                                                          if (state.status ==
                                                              ReportAdvertStatus
                                                                  .success) {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      'report successfully')),
                                                            );
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'this filled is required')),
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
                                                    hintText: 'Write why..',
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color1
                                                                    .primaryColor,
                                                                width: 1)),
                                                  ),
                                                  controller: m,
                                                  maxLength: 100,
                                                  maxLines: 3,
                                                  cursorColor:
                                                      Color1.primaryColor,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 250),
                        Container(
                          padding: const EdgeInsets.only(left: 12),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(80, 82, 82, 0.7),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  ll['building_name'],
                                  style: Style.textStyle32
                                      .copyWith(color: Color1.white),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${ll['location']['country']} , ${ll['location']['city']},\n${ll['location']['neighborhood']},${ll['location']['street']}'
                                  '\nspace : ${ll['space']} m²',
                                  style: Style.textStyle18
                                      .copyWith(color: Color1.white),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  ll['description'],
                                  style: Style.textStyle18
                                      .copyWith(color: Color1.white),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PropertyDescription(
                                    text: 'bedrooms',
                                    number: ll['room_count'],
                                    icon: Icons.bed,
                                  ),
                                  PropertyDescription(
                                    text: 'bathrooms',
                                    number: ll['bath_count'],
                                    icon: Icons.bathroom,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PropertyDescription(
                                    text: 'floor count',
                                    number: ll['floor_count'],
                                    icon: Icons.house,
                                  ),
                                  PropertyDescription(
                                    text: 'floor number',
                                    number: ll['floor_number'],
                                    icon: Icons.numbers,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              sec != null
                                  ? Column(
                                      children: [
                                        sec.isNotEmpty
                                            ? Builder(builder: (context) {
                                                var ll = [];
                                                if (sec['guard'] == 1) {
                                                  ll.add('guard');
                                                }
                                                if (sec['cameras'] == 1) {
                                                  ll.add('cameras');
                                                }
                                                if (sec['fire_alert'] == 1) {
                                                  ll.add('fire alert');
                                                }
                                                if (sec['earth_quake'] == 1) {
                                                  ll.add('earthquake');
                                                }
                                                return ll.isNotEmpty
                                                    ? SizedBox(
                                                        height: 75,
                                                        child: ListView.builder(
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          itemCount: ll.length,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return PropertyDescription(
                                                              text: ll[index],
                                                              number: 0,
                                                              icon: Icons.house,
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : Container();
                                              })
                                            : Container(),
                                        sec.isNotEmpty
                                            ? const SizedBox(
                                                height: 10,
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : Container(),
                              lux != null
                                  ? Column(
                                      children: [
                                        lux.isNotEmpty
                                            ? Builder(builder: (context) {
                                                var ll = [];
                                                if (lux['pool'] == 1) {
                                                  ll.add('pool');
                                                }
                                                if (lux['garden'] == 1) {
                                                  ll.add('garden');
                                                }
                                                if (lux['view_on_sea'] == 1) {
                                                  ll.add('view on sea');
                                                }
                                                return ll.isNotEmpty
                                                    ? SizedBox(
                                                        height: 75,
                                                        child: ListView.builder(
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          itemCount: ll.length,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return PropertyDescription(
                                                              text: ll[index],
                                                              number: 0,
                                                              icon: Icons.house,
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : Container();
                                              })
                                            : Container(),
                                        lux.isNotEmpty
                                            ? const SizedBox(
                                                height: 10,
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : Container(),
                              sup != null
                                  ? Column(
                                      children: [
                                        sup.isNotEmpty
                                            ? Builder(builder: (context) {
                                                var ll = [];
                                                if (sup['solar_power'] == 1) {
                                                  ll.add('solar power');
                                                }
                                                if (sup['internet_access'] ==
                                                    1) {
                                                  ll.add('internet access');
                                                }
                                                if (sup['elevator'] == 1) {
                                                  ll.add('elevator');
                                                }
                                                if (sup['land_line'] == 1) {
                                                  ll.add('land line');
                                                }
                                                if (sup['Main_street_access'] ==
                                                    1) {
                                                  ll.add('Main street access');
                                                }
                                                if (sup['garage'] == 1) {
                                                  ll.add('garage');
                                                }
                                                return ll.isNotEmpty
                                                    ? SizedBox(
                                                        height: 75,
                                                        child: ListView.builder(
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          itemCount: ll.length,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return PropertyDescription(
                                                              text: ll[index],
                                                              number: 0,
                                                              icon: Icons.house,
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : Container();
                                              })
                                            : Container(),
                                        sup.isNotEmpty
                                            ? const SizedBox(
                                                height: 10,
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : Container(),
                              ind != null
                                  ? Column(
                                      children: [
                                        ind.isNotEmpty
                                            ? Builder(builder: (context) {
                                                var ll = [];
                                                if (ind['isolation'] == 1) {
                                                  ll.add('isolation');
                                                }
                                                if (ind['roden_control'] == 1) {
                                                  ll.add('rodent control');
                                                }
                                                if (ind['truck_accessible'] ==
                                                    1) {
                                                  ll.add('truck accessible');
                                                }
                                                return ll.isNotEmpty
                                                    ? SizedBox(
                                                        height: 75,
                                                        child: ListView.builder(
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          itemCount: ll.length,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return PropertyDescription(
                                                              text: ll[index],
                                                              number: 0,
                                                              icon: Icons.house,
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : Container();
                                              })
                                            : Container(),
                                        ind.isNotEmpty
                                            ? const SizedBox(
                                                height: 10,
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : Container(),
                              heat != null
                                  ? Column(
                                      children: [
                                        heat.isNotEmpty
                                            ? Builder(builder: (context) {
                                                var ll = [];
                                                if (heat['air_condtioning'] ==
                                                    1) {
                                                  ll.add('air conditioning');
                                                }
                                                if (heat['fireplace'] == 1) {
                                                  ll.add('fireplace');
                                                }
                                                if (heat[
                                                        'ventilation_system'] ==
                                                    1) {
                                                  ll.add('ventilation system');
                                                }
                                                return ll.isNotEmpty
                                                    ? SizedBox(
                                                        height: 75,
                                                        child: ListView.builder(
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          itemCount: ll.length,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return PropertyDescription(
                                                              text: ll[index],
                                                              number: 0,
                                                              icon: Icons.house,
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : Container();
                                              })
                                            : Container(),
                                        heat.isNotEmpty
                                            ? const SizedBox(
                                                height: 10,
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : Container(),
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(context: context, builder: (context) {
                                      return AlertDialog(
                                        title: Text('images'),
                                        content: SizedBox(
                                          width: 300.0,
                                          child: image.isEmpty
                                              ? const Center(child: Text('Sorry nothing selected!!'))
                                              : GridView.builder(
                                            shrinkWrap: true,
                                            itemCount: image.length,
                                            gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3
                                              // Horizontally only 3 images will show
                                            ),
                                            itemBuilder: (BuildContext context, int index) {
                                              // TO show selected file
                                              return Center(
                                                  child:  Image.network('${Api.apiServer.substring(0, 23)}/${image[index]['imageData'].substring(63)}'));
                                              // If you are making the web app then you have to
                                              // use image provider as network image or in
                                              // android or iOS it will as file only
                                            },
                                          ),
                                        ),
                                      );
                                    },);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color1.primaryColor),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(15)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                        )),
                                  ),
                                  child: const Text(
                                    'show Image',
                                  )),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Property Owner',
                                  style: Style.textStyle20
                                      .copyWith(color: Color1.white),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              PropertyOwner(
                                id: po['id'],
                                name: po['name'],
                                email: po['email'],
                                phone: po['phone_number'] ?? 'No Phone Number',
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
                                                                            po['id'],
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
                                                            id: po['id'],
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
                                color: Colors.white24,
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: 100,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color1.primaryColor,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Request for this property',
                                            style: Style.textStyle20.copyWith(
                                                color: Color1.primaryColor),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text(
                                                'cancel',
                                                style:
                                                    Style.textStyle16.copyWith(
                                                  fontSize: 14,
                                                  color: Color1.primaryColor
                                                      .withOpacity(.7),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            BlocBuilder<RequestCubit,
                                                RequestState>(
                                              builder: (context, state) {
                                                return TextButton(
                                                  child: Text(
                                                    'Approve',
                                                    style: Style.textStyle16
                                                        .copyWith(
                                                      fontSize: 14,
                                                      color: Color1.primaryColor
                                                          .withOpacity(.7),
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    if (m.text.isNotEmpty) {
                                                      await BlocProvider.of<
                                                                  RequestCubit>(
                                                              context)
                                                          .sendRequest(
                                                              aId, m.text);
                                                      Navigator.of(context)
                                                          .pop();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'request done successfully')),
                                                      );
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'this filled is required')),
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                            )
                                          ],
                                          content: Container(
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                hintText: 'Write a message..',
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color1
                                                                .primaryColor,
                                                            width: 1)),
                                              ),
                                              controller: m,
                                              maxLength: 100,
                                              maxLines: 3,
                                              cursorColor: Color1.primaryColor,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$price \$',
                                        style: Style.textStyle20
                                            .copyWith(color: Color1.white),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Include all taxes',
                                style: Style.textStyle18
                                    .copyWith(color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
