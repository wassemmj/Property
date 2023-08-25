import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/logic/create_property_cubit/create_property_cubit.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_check_box.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_count.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_text_field.dart';

import 'package:intl/intl.dart' as intl;
import 'package:property_app/views/image_view/imageView.dart';

import '../../data/Model/property_model.dart';
import '../../logic/all_property_cubit/all_property_cubit.dart';
import '../../logic/location_cubit/location_cubit.dart';

class AddPropertyView extends StatefulWidget {
  const AddPropertyView({Key? key}) : super(key: key);

  @override
  State<AddPropertyView> createState() => _AddPropertyViewState();
}

class _AddPropertyViewState extends State<AddPropertyView> {
  int index = 0;
  late List screens;

  List<String> items = [
    'Select Type',
    'purchase',
    'Rent',
  ];

  String? value = 'Select Type';
  String? dropdownvalue = 'Select Item';
  String? dropdownvalue1 = 'Select Item';

  var buildingName = TextEditingController();
  var description = TextEditingController();
  double space = 0.0;
  int catId = 0;
  var location;

  bool owner = false;
  bool shared = false;
  int bathCount = 0;
  int floorCount = 0;
  var floorNumber = TextEditingController();
  var price = TextEditingController();
  var cap = TextEditingController();
  int roomCount = 0;

  bool airCondition = false;
  bool fireplace = false;
  bool ventilationSystem = false;
  bool isSecurity = false;
  bool guard = false;
  bool camera = false;
  bool fireAlert = false;
  bool earthquake = false;
  bool isSupplies = false;
  bool solarPower = false;
  bool internet = false;
  bool elevator = false;
  bool landLine = false;
  bool mas = false;
  bool garage = false;
  bool isLuxury = false;
  bool pool = false;
  bool garden = false;
  bool vos = false;
  bool isInd = false;
  bool isolation = false;
  bool rodenControl = false;
  late DateTime date = DateTime.now();

  var m = TextEditingController();
  var c;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<AllPropertyCubit>(context, listen: false).catt();
      await BlocProvider.of<LocationCubit>(context, listen: false).pro();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screens = [
      Column(
        children: [
          AddPropertyTextField(
              name: 'Building Name  ', num: false, e: buildingName),
          TextFormField(
            maxLength: 100,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'description  ',
              hintStyle: Style.textStyle18,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color1.primaryColor,
                    width: 1,
                  )),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color1.primaryColor,
                    width: 1,
                  )),
            ),
            controller: description,
            cursorColor: Color1.primaryColor,
          ),
          AddPropertyTextField(
              name: 'Floor Number  ', num: false, e: floorNumber),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Space',
                style:
                Style.textStyle18.copyWith(color: Color1.primaryColor),
              ),
              SliderTheme(
                data: const SliderThemeData(
                  showValueIndicator: ShowValueIndicator.always,
                ),
                child: Slider(
                  min: 0,
                  max: 700,
                  divisions: 140,
                  activeColor: Color1.primaryColor,
                  value: space,
                  label: space.toInt().toString(),
                  onChanged: (value) {
                    setState(() {
                      space = value;
                    });
                  },
                ),
              ),
            ],
          ),
          BlocBuilder<LocationCubit, LocationState>(
            builder: (context, state) {
              if (state.status == LocationStatus.loading ||
                  state.status == LocationStatus.initial) {
                return const Center(
                    child: CircularProgressIndicator(
                      color: Color1.primaryColor,
                      strokeWidth: 1,
                    ));
              }
              if (BlocProvider
                  .of<LocationCubit>(context)
                  .proo == null) {
                return const Center(
                    child: CircularProgressIndicator(
                      color: Color1.primaryColor,
                      strokeWidth: 1,
                    ));
              }
              var proo = BlocProvider
                  .of<LocationCubit>(context)
                  .proo;
              List<String> li = [];
              for (int i = 0; i < proo.length; i++) {
                li.add(proo[i]['country'] +
                    '; ' +
                    proo[i]['city'] +
                    '; ' +
                    proo[i]['neighborhood'] +
                    '; ' +
                    proo[i]['street']);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location :",
                    style: Style.textStyle22.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color1.primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TypeAheadField(
                    animationStart: 0,
                    animationDuration: Duration.zero,
                    textFieldConfiguration: TextFieldConfiguration(
                        style: const TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color1.primaryColor, width: 1),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color1.primaryColor, width: 1),
                              borderRadius: BorderRadius.circular(35),
                            ))),
                    suggestionsBoxDecoration: SuggestionsBoxDecoration(
                        color: Colors.lightBlue[50]),
                    suggestionsCallback: (pattern) {
                      List<String> matches = <String>[];
                      matches.addAll(li);
                      matches.retainWhere((s) {
                        return s
                            .toLowerCase()
                            .contains(pattern.toLowerCase());
                      });
                      return matches;
                    },
                    itemBuilder: (context, soe) {
                      return Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(soe.toString()),
                          ));
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        m.text = suggestion;
                        location = proo[li.indexOf(suggestion)];
                      });
                      print(suggestion);
                      print(li.contains(suggestion));
                      var r = li.indexOf(suggestion);
                    },
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Property Kind',
                style: Style.textStyle18.copyWith(color: Color1.primaryColor),
              ),
              const SizedBox(
                width: 75,
              ),
              BlocBuilder<AllPropertyCubit, AllPropertyState>(
                builder: (context, state) {
                  if (state.status == AllPropertyStatus.loading) {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: Color1.primaryColor,
                          strokeWidth: 1,
                        ));
                  }
                  if (BlocProvider
                      .of<AllPropertyCubit>(context)
                      .category ==
                      null) {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: Color1.primaryColor,
                          strokeWidth: 1,
                        ));
                  }
                  var cat = BlocProvider
                      .of<AllPropertyCubit>(context)
                      .category;
                  List<String> catName = [];
                  for (int i = 0; i < cat!.length; i++) {
                    if (catName.contains(cat[i]['name'])) {} else {
                      catName.add(cat[i]['name']);
                    }
                  }
                  List<String> items = ['Select Item', ...catName];
                  return DropdownButton(
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: dropdownvalue,
                    onChanged: (val) async {
                      c = BlocProvider
                          .of<AllPropertyCubit>(context)
                          .category!
                          .where((element) => element['name'] == val)
                          .toList();
                      setState(() {
                        dropdownvalue = val;
                        // catId = cat[0]['id'];
                      });
                      await BlocProvider.of<AllPropertyCubit>(context)
                          .type(val!);
                    },
                    iconEnabledColor: Color1.primaryColor,
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Property Type',
                style: Style.textStyle18.copyWith(color: Color1.primaryColor),
              ),
              const SizedBox(
                width: 75,
              ),
              BlocBuilder<AllPropertyCubit, AllPropertyState>(
                builder: (context, state) {
                  if (dropdownvalue == 'Select Item') {
                    List<String> items = ['Select Item'];
                    return DropdownButton(
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      value: dropdownvalue1,
                      onChanged: (val) {
                        List cat = c
                            .where((element) => element['type'] == val)
                            .toList();
                        print(cat);
                        setState(() {
                          dropdownvalue1 = val;
                          catId = cat[0]['id'];
                        });
                        print(catId);
                      },
                      iconEnabledColor: Color1.primaryColor,
                    );
                  }
                  if (state.status == AllPropertyStatus.loading) {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: Color1.primaryColor,
                          strokeWidth: 1,
                        ));
                  }
                  if (BlocProvider
                      .of<AllPropertyCubit>(context)
                      .types ==
                      null) {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: Color1.primaryColor,
                          strokeWidth: 1,
                        ));
                  }
                  var cat = BlocProvider
                      .of<AllPropertyCubit>(context)
                      .types;
                  List<String> items = ['Select Item', ...?cat];
                  return DropdownButton(
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: dropdownvalue1,
                    onChanged: (val) {
                      List cat =
                      c.where((element) => element['type'] == val).toList();
                      print(cat);
                      setState(() {
                        dropdownvalue1 = val;
                        catId = cat[0]['id'];
                      });
                    },
                    iconEnabledColor: Color1.primaryColor,
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Contract Type',
                style: Style.textStyle18.copyWith(color: Color1.primaryColor),
              ),
              const SizedBox(
                width: 75,
              ),
              DropdownButton(
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                icon: const Icon(Icons.keyboard_arrow_down),
                value: value,
                onChanged: (val) {
                  setState(() {
                    value = val;
                  });
                },
                iconEnabledColor: Color1.primaryColor,
              ),
            ],
          ),
          AddPropertyCheckBox(
            text: 'Owner',
            value: owner,
            color: Color1.primaryColor,
            onPressed: (val) => setState(() => owner = val!),
          ),
          AddPropertyCheckBox(
            text: 'Shared',
            value: shared,
            color: Color1.primaryColor,
            onPressed: (val) => setState(() => shared = val!),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddPropertyCount(
            text: 'Floor Count',
            number: floorCount,
            onPressed1: () {
              setState(() {
                floorCount++;
              });
            },
            onPressed2: () {
              setState(() {
                if (floorCount <= 0) {
                  floorCount = 0;
                } else {
                  floorCount--;
                }
              });
            },
          ),
          AddPropertyCount(
            text: 'Bathroom',
            number: bathCount,
            onPressed1: () {
              setState(() {
                bathCount++;
              });
            },
            onPressed2: () {
              setState(() {
                if (bathCount == 0) {
                  bathCount = 0;
                } else {
                  bathCount--;
                }
              });
            },
          ),
          AddPropertyCount(
            text: 'Rooms',
            number: roomCount,
            onPressed1: () {
              setState(() {
                roomCount++;
              });
            },
            onPressed2: () {
              setState(() {
                if (roomCount == 0) {
                  roomCount = 0;
                } else {
                  roomCount--;
                }
              });
            },
          ),
          AddPropertyCheckBox(
            text: 'Air Condition',
            value: airCondition,
            color: Color1.black,
            onPressed: (val) => setState(() => airCondition = val!),
          ),
          AddPropertyCheckBox(
            text: 'Fire Place',
            value: fireplace,
            color: Color1.black,
            onPressed: (val) => setState(() => fireplace = val!),
          ),
          AddPropertyCheckBox(
            text: 'ventilation System',
            value: ventilationSystem,
            color: Color1.black,
            onPressed: (val) => setState(() => ventilationSystem = val!),
          ),
          AddPropertyCheckBox(
            text: 'isSecurity',
            value: isSecurity,
            color: Color1.black,
            onPressed: (val) => setState(() => isSecurity = val!),
          ),
          AddPropertyCheckBox(
            text: 'guard',
            value: guard,
            color: Color1.black,
            onPressed: (val) => setState(() => guard = val!),
          ),
          AddPropertyCheckBox(
            text: 'Camera',
            color: Color1.black,
            value: camera,
            onPressed: (val) => setState(() => camera = val!),
          ),
          AddPropertyCheckBox(
            text: 'Fire Alert',
            value: fireAlert,
            color: Color1.black,
            onPressed: (val) => setState(() => fireAlert = val!),
          ),
          AddPropertyCheckBox(
            text: 'earthquake',
            value: earthquake,
            color: Color1.black,
            onPressed: (val) => setState(() => earthquake = val!),
          ),
          AddPropertyCheckBox(
            text: 'isolation',
            value: isolation,
            color: Color1.black,
            onPressed: (val) => setState(() => isolation = val!),
          ),
          AddPropertyCheckBox(
            text: 'rodent Control',
            value: rodenControl,
            color: Color1.black,
            onPressed: (val) => setState(() => rodenControl = val!),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AddPropertyCheckBox(
            text: 'isSupplies',
            value: isSupplies,
            color: Color1.black,
            onPressed: (val) => setState(() => isSupplies = val!),
          ),
          AddPropertyCheckBox(
            text: 'solar power',
            value: solarPower,
            color: Color1.black,
            onPressed: (val) => setState(() => solarPower = val!),
          ),
          AddPropertyCheckBox(
            text: 'internet',
            value: internet,
            color: Color1.black,
            onPressed: (val) => setState(() => internet = val!),
          ),
          AddPropertyCheckBox(
            text: 'elevator',
            value: elevator,
            color: Color1.black,
            onPressed: (val) => setState(() => elevator = val!),
          ),
          AddPropertyCheckBox(
            text: 'land Line',
            value: landLine,
            color: Color1.black,
            onPressed: (val) => setState(() => landLine = val!),
          ),
          AddPropertyCheckBox(
            text: 'Main Access Street',
            value: mas,
            color: Color1.black,
            onPressed: (val) => setState(() => mas = val!),
          ),
          AddPropertyCheckBox(
            text: 'garage',
            value: garage,
            color: Color1.black,
            onPressed: (val) => setState(() => garage = val!),
          ),
          AddPropertyCheckBox(
            text: 'isLuxury',
            value: isLuxury,
            color: Color1.black,
            onPressed: (val) => setState(() => isLuxury = val!),
          ),
          AddPropertyCheckBox(
            text: 'pool',
            value: pool,
            color: Color1.black,
            onPressed: (val) => setState(() => pool = val!),
          ),
          AddPropertyCheckBox(
            text: 'garden',
            value: garden,
            color: Color1.black,
            onPressed: (val) => setState(() => garden = val!),
          ),
          AddPropertyCheckBox(
            text: 'view on sea',
            value: vos,
            color: Color1.black,
            onPressed: (val) => setState(() => vos = val!),
          ),
          AddPropertyCheckBox(
            text: 'isIndustrial',
            value: isInd,
            color: Color1.black,
            onPressed: (val) => setState(() => isInd = val!),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AddPropertyTextField(name: 'price    ', num: false, e: price),
          AddPropertyTextField(
              name: 'capacity  ', num: false, e: cap),
          ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2025),
                  context: context,
                  builder: (ctx, w) {
                    return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Color1.primaryColor,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              primary:
                              Color1.primaryColor, // button text color
                            ),
                          ),
                        ),
                        child: w!);
                  },
                );
                if (pickedDate != null) {
                  print(pickedDate);
                  setState(() => date = pickedDate);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )
                ),
              ),
              child: const Text('pick deliver date')),
        ],
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CreatePropertyCubit, CreatePropertyState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back,
                              color: Color1.primaryColor),
                          onPressed: () {
                            if(index>0) {
                              setState(() {
                                index--;
                              });
                            }
                            else {
                             Navigator.of(context).pop();
                            }
                          },
                        ),
                        const SizedBox(width: 80),
                        const Text(
                          'Add new Property',
                          style: Style.textStyle22,
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    screens[index],
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: BlocBuilder<CreatePropertyCubit,
          CreatePropertyState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () async {
              setState(() {
                if (index < screens.length - 1) {
                  index++;
                }
              });
              print(location);
              if (price.text.isNotEmpty) {
                await BlocProvider.of<CreatePropertyCubit>(context).create(
                    PropertyModel(
                      locationId: location['id'],
                      categoryId: '${catId}',
                      space: space.toInt(),
                      description: description.text,
                      bathCount: bathCount,
                      roomCount: roomCount,
                      floorCount: floorCount,
                      floorNumber: int.parse(floorNumber.text),
                      buildingName: buildingName.text,
                      shared: shared,
                      owner: owner,
                      airConditioning: airCondition,
                      fireplace: fireplace,
                      ventilationSystem: ventilationSystem,
                      isSecurity: isSecurity,
                      guard: guard,
                      cameras: camera,
                      fireAlert: fireAlert,
                      earthQuake: earthquake,
                      isSupplies: isSupplies,
                      solarPower: solarPower,
                      internetAccess: internet,
                      elevator: elevator,
                      landLine: landLine,
                      mainStreetAccess: mas,
                      garage: garage,
                      isLuxry: isLuxury,
                      pool: pool,
                      garden: garden,
                      viewOnSea: vos,
                      isindustry: isInd,
                      isolation: isolation,
                      rodenControl: rodenControl,
                      capacity: int.parse(cap.text),
                      truckAccessible: false,
                      rent: value == 'rent' ? true : false,
                      receivingDate: intl.DateFormat('yyyy-MM-dd').format(
                          DateTime.now()).toString(),
                      delivareTime: intl.DateFormat('yyyy-MM-dd')
                          .format(date)
                          .toString(),
                      pricePerDay: value == 'rent' ? int.parse(price.text) : 0,
                      purchase: value != 'rent' ? true : false,
                      pricePerMeter: value != 'rent'
                          ? int.parse(price.text)
                          : 0,
                    ));
                var p = BlocProvider.of<CreatePropertyCubit>(context).proo;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageView(id: p["property_id"],),));
              }
            },
            backgroundColor: Color1.primaryColor.withOpacity(0.7),
            child: Icon(
              index == screens.length - 1 ? Icons.check : Icons.arrow_forward,
              color: Color1.white,
            ),
          );
        },
      ),
    );
  }
}
