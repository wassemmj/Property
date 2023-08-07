import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/logic/all_property_cubit/all_property_cubit.dart';
import 'package:property_app/logic/detail_cubit/detail_cubit.dart';
import 'package:property_app/logic/report_advert_cubit/report_advert_cubit.dart';
import 'package:property_app/views/PropertyDetailsView/Widget/property_description.dart';
import 'package:property_app/views/profileView/profile_view.dart';
import 'package:property_app/views/propertyDetailsView/widget/property_owner.dart';
import 'package:property_app/views/reportView/report_view.dart';

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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<DetailCubit>(context, listen: false)
          .detail(widget.id);
    });
    super.initState();
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
            } else {
              var ll = BlocProvider.of<DetailCubit>(context).pro;
              var sec = ll['security_model'];
              var lux = ll['luxery_model'];
              var sup = ll['support_model'];
              var ind = ll['industrial_model'];
              var heat = ll['heat_control_model'];
              var po = ll['property_owner'];
              id = ll['property']['id'];
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/img_1.png',
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
                                    IconButton(
                                      icon: Icon(
                                        fav
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                        size: 28,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          fav = !fav;
                                        });
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
                                                              .pro(id, m.text);
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
                                  ll['property']['building_name'] +
                                      ' , ' +
                                      BlocProvider.of<AllPropertyCubit>(context)
                                                  .category?[
                                              ll['property']['category_id'] - 1]
                                          ['type'],
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
                                  '${ll['property']['location_id']}, ${ll['property']['space']} m',
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
                                  ll['property']['description'],
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
                                    number: ll['property']['room_count'],
                                    icon: Icons.bed,
                                  ),
                                  PropertyDescription(
                                    text: 'bathrooms',
                                    number: ll['property']['bath_count'],
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
                                    number: ll['property']['floor_count'],
                                    icon: Icons.house,
                                  ),
                                  PropertyDescription(
                                    text: 'floor number',
                                    number: ll['property']['floor_number'],
                                    icon: Icons.numbers,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              sec.isNotEmpty
                                  ? Builder(builder: (context) {
                                      var ll = [];
                                      if (sec[0]['guard'] == 1) {
                                        ll.add('guard');
                                      }
                                      if (sec[0]['cameras'] == 1) {
                                        ll.add('cameras');
                                      }
                                      if (sec[0]['fire_alert'] == 1) {
                                        ll.add('fire alert');
                                      }
                                      if (sec[0]['earth_quake'] == 1) {
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
                                                itemBuilder: (context, index) {
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
                              lux.isNotEmpty
                                  ? Builder(builder: (context) {
                                      var ll = [];
                                      if (lux[0]['pool'] == 1) {
                                        ll.add('pool');
                                      }
                                      if (lux[0]['garden'] == 1) {
                                        ll.add('garden');
                                      }
                                      if (lux[0]['view_on_sea'] == 1) {
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
                                                itemBuilder: (context, index) {
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
                              sup.isNotEmpty
                                  ? Builder(builder: (context) {
                                      var ll = [];
                                      if (sup[0]['solar_power'] == 1) {
                                        ll.add('solar power');
                                      }
                                      if (sup[0]['internet_access'] == 1) {
                                        ll.add('internet access');
                                      }
                                      if (sup[0]['land_line'] == 1) {
                                        ll.add('land line');
                                      }
                                      if (sup[0]['Main_street_access'] == 1) {
                                        ll.add('Main street access');
                                      }
                                      if (sup[0]['garage'] == 1) {
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
                                                itemBuilder: (context, index) {
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
                              ind.isNotEmpty
                                  ? Builder(builder: (context) {
                                      var ll = [];
                                      if (ind[0]['isolation'] == 1) {
                                        ll.add('isolation');
                                      }
                                      if (ind[0]['roden_control'] == 1) {
                                        ll.add('rodent control');
                                      }
                                      if (ind[0]['truck_accessible'] == 1) {
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
                                                itemBuilder: (context, index) {
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
                              heat.isNotEmpty
                                  ? Builder(builder: (context) {
                                      var ll = [];
                                      if (heat[0]['air_condtioning'] == 1) {
                                        ll.add('air conditioning');
                                      }
                                      if (heat[0]['fireplace'] == 1) {
                                        ll.add('fireplace');
                                      }
                                      if (heat[0]['ventilation_system'] == 1) {
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
                                                itemBuilder: (context, index) {
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
                                id: po[0]['id'],
                                name: po[0]['name'],
                                email: po[0]['email'],
                                phone: po[0]['phone_number']?? 'No Phone Number',
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
                                                                    await BlocProvider.of<ReportAdvertCubit>(context).pro(
                                                                        po[0][
                                                                            'id'],
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
                                                            id: po[0]['id'],
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
                                            BlocBuilder<RequestCubit, RequestState>(
                                              builder: (context, state) {
                                                return TextButton(
                                                  child: Text(
                                                    'Approve',
                                                    style: Style.textStyle16.copyWith(
                                                      fontSize: 14,
                                                      color: Color1.primaryColor.withOpacity(.7),
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    if (m.text.isNotEmpty) {
                                                      await BlocProvider.of<RequestCubit>(context).sendRequest(id, m.text);
                                                      if (state.status ==
                                                          RequestStatus.success) {
                                                        Navigator.of(context).pop();
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          const SnackBar(
                                                              content: Text(
                                                                  'request done successfully')),
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
                                  child: Center(
                                      child: Text(
                                    'price',
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
