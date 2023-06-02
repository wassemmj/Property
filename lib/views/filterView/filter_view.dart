import 'package:flutter/material.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/core/style.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_location.dart';
import 'package:property_app/views/filterView/widget/filter_kind.dart';

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

  List<String> kindList = [
    'Shopping',
    'Comedy',
    'Brunch',
    'Music',
    'Road Trips',
    'Tea',
  ];

  List<String>? selectedKind = [];

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
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Wrap(
              spacing: 15,
              children: kindList.map(
                (kind) {
                  bool isSelected = false;
                  if (selectedKind!.contains(kind)) {
                    isSelected = true;
                  }
                  return GestureDetector(
                    onTap: () {
                      if (!selectedKind!.contains(kind)) {
                        setState(() {
                          selectedKind!.add(kind);
                        });
                      } else {
                        setState(() {
                          selectedKind!
                              .removeWhere((element) => element == kind);
                        });
                      }
                    },
                    child: FilterKind(kind: kind,isSelected: isSelected,),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Space',
                  style: Style.textStyle18.copyWith(color: Color1.primaryColor),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                  child: RangeSlider(
                    min: 0,
                    max: 700,
                    divisions: 140,
                    values: RangeValues(spaceStart, spaceEnd),
                    activeColor: Color1.primaryColor.withOpacity(0.7),
                    labels: RangeLabels(spaceStart.toInt().toString(),
                        spaceEnd.toInt().toString()),
                    onChanged: (value) {
                      setState(() {
                        spaceStart = value.start;
                        spaceEnd = value.end;
                      });
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: Style.textStyle18.copyWith(color: Color1.primaryColor),
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
            const AddPropertyLocation(add: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
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
            ),
          ],
        ),
      ),
    );
  }
}