import 'package:flutter/material.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_check_box.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_count.dart';

import '../../../Core/color1.dart';

class AddProperty2 extends StatefulWidget {
  const AddProperty2({Key? key, required this.indexz}) : super(key: key);

  final Function() indexz;
  @override
  State<AddProperty2> createState() => _AddProperty2State();
}

class _AddProperty2State extends State<AddProperty2> {
  int bathCount = 0;
  int floorCount = 0;
  int roomCount = 0;

  bool heat = false;
  bool airCondition = false;
  bool solarPower = false;
  bool garage = false;
  bool camera = false;
  bool fireAlert = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddPropertyCount(
          text: 'Floor',
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
              }
              else {
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
              }else {
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
          text: 'Solar Power',
          color: Color1.black,
          value: solarPower,
          onPressed: (val) => setState(() => solarPower = val!),
        ),
        AddPropertyCheckBox(
          text: 'Garage',
          color: Color1.black,
          value: garage,
          onPressed: (val) => setState(() => garage = val!),
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
      ],
    );
  }
}
