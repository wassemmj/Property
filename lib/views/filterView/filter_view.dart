import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/core/style.dart';
import 'package:property_app/logic/all_property_cubit/all_property_cubit.dart';
import 'package:property_app/logic/filter_cubit/filter_cubit.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_location.dart';
import 'package:property_app/views/filterView/widget/filter_kind.dart';
import 'package:property_app/views/showMoreView/show_more_view.dart';

import '../../logic/location_cubit/location_cubit.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  double spaceStart = 0;
  double spaceEnd = 700;

  double priceStart = 0;
  double priceEnd = 20000;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<AllPropertyCubit>(context, listen: false).catType();
      await BlocProvider.of<LocationCubit>(context, listen: false).pro();
      // await BlocProvider.of<AllPropertyCubit>(context, listen: false).type();
    });
    super.initState();
  }

  List<String>? selectedKind = [];

  var k;

  List<String>? selectedKind1 = [];

  var k1;
  var m = TextEditingController();

  List<String> items = [
    'Select Type',
    'purchase',
    'Rent',
  ];

  String? value = 'Select Type';
  var location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Color1.primaryColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Reset',
                style: Style.textStyle20.copyWith(
                  fontSize: 19,
                  color: Color1.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              BlocBuilder<AllPropertyCubit, AllPropertyState>(
                builder: (context, state) {
                  if (BlocProvider.of<AllPropertyCubit>(context).category ==
                      null) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Color1.primaryColor,
                      strokeWidth: 1,
                    ));
                  }
                  var i = BlocProvider.of<AllPropertyCubit>(context).category;
                  List<String> catName = [];
                  for(int j =0 ;j<i!.length;j++) {
                    if(catName.contains(i[j]['name'])) {

                    }
                    else {
                      catName.add(i[j]['name']);
                    }
                  }
                  print(catName);

                  return Wrap(
                    spacing: 0,
                    children: catName!.map(
                      (kind) {
                        bool isSelected = false;
                        if (selectedKind!.contains(kind)) {
                          isSelected = true;
                        }
                        return GestureDetector(
                          onTap: () async {
                            if (selectedKind!.isEmpty &&
                                !selectedKind!.contains(kind)) {
                              setState(() {
                                selectedKind!.add(kind);
                              });
                              i = await BlocProvider.of<AllPropertyCubit>(
                                      context)
                                  .type(kind);
                              setState(() {
                                k = catName[0];
                              });
                            } else {
                              setState(() {
                                selectedKind!.removeWhere(
                                    (element) => element == kind);
                              });
                            }
                          },
                          child: FilterKind(
                            kind: kind,
                            isSelected: isSelected,
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
              selectedKind!.isEmpty
                  ? Container()
                  : BlocBuilder<AllPropertyCubit, AllPropertyState>(
                      builder: (context, state) {
                        if (BlocProvider.of<AllPropertyCubit>(context).types ==
                            null) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Color1.primaryColor,
                            strokeWidth: 1,
                          ));
                        }
                        var i =
                            BlocProvider.of<AllPropertyCubit>(context).types;
                        print(i);
                        return Wrap(
                          spacing: 0,
                          children: i!.map(
                            (kind) {
                              bool isSelected = false;
                              if (selectedKind1!.contains(kind)) {
                                isSelected = true;
                              }
                              return GestureDetector(
                                onTap: () async {
                                  if (selectedKind1!.isEmpty &&
                                      !selectedKind1!.contains(kind)) {
                                    setState(() {
                                      selectedKind1!.add(kind);
                                    });
                                    setState(() {
                                      k1 = i[0];
                                    });
                                  } else {
                                    setState(() {
                                      selectedKind1!.removeWhere(
                                          (element) => element == kind);
                                    });
                                  }
                                },
                                child: FilterKind(
                                  kind: kind,
                                  isSelected: isSelected,
                                ),
                              );
                            },
                          ).toList(),
                        );
                      },
                    ),
              const SizedBox(height: 10),
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
                      value: spaceStart,
                      label: spaceStart.toInt().toString(),
                      onChanged: (value) {
                        setState(() {
                          spaceStart = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style:
                        Style.textStyle18.copyWith(color: Color1.primaryColor),
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      showValueIndicator: ShowValueIndicator.always,
                    ),
                    child: RangeSlider(
                      min: 0,
                      max: 20000,
                      divisions: 140,
                      values: RangeValues(priceStart, priceEnd),
                      activeColor: Color1.primaryColor.withOpacity(0.7),
                      labels: RangeLabels(
                        priceStart.toInt().toString(),
                        priceEnd.toInt().toString(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          priceStart = value.start;
                          priceEnd = value.end;
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
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
                  if (BlocProvider.of<LocationCubit>(context).proo == null) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Color1.primaryColor,
                      strokeWidth: 1,
                    ));
                  }
                  var proo = BlocProvider.of<LocationCubit>(context).proo;
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
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Contract Type',
                    style:
                        Style.textStyle18.copyWith(color: Color1.primaryColor),
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
              const SizedBox(height: 20),
              BlocBuilder<FilterCubit, FilterState>(
                builder: (context, state) {
                  if (state.status == FilterStatus.loading) {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: Color1.primaryColor,
                          strokeWidth: 1,
                        ));
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      print(location);
                      print(value);
                      print(selectedKind);
                      print(selectedKind1);
                      print(spaceStart);
                      print(priceStart.toInt());
                      print(priceEnd.toInt());

                      await BlocProvider.of<FilterCubit>(context).pro(
                          location != null ? location['country'] : '',
                          location != null ? location['city'] : '',
                          location != null ? location['neighborhood'] : '',
                          value != 'Select Type' ? value! : '',
                          selectedKind!.isNotEmpty ? selectedKind![0] : '',
                          selectedKind1!.isNotEmpty ? selectedKind1![0] : '',
                          spaceStart == 0.0
                              ? spaceStart.toInt().toString()
                              : '',
                          priceStart == 0
                              ? priceStart.toInt().toString()
                              : '',
                          priceEnd == 20000
                              ? priceEnd.toInt().toString()
                              : '',
                      );
                      if(BlocProvider.of<FilterCubit>(context).proo == 'no property have been found for this specifec values') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('no property have been found for this specifec values')));
                      } else if(BlocProvider.of<FilterCubit>(context).proo == 'no result') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('no result')));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowMoreView(l: BlocProvider.of<FilterCubit>(context).proo),));
                      }
                    },
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all(Color1.primaryColor),
                      foregroundColor: MaterialStateProperty.all(Color1.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Filter Property',
                      style: Style.textStyle16,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
