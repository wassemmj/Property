import 'package:flutter/material.dart';

import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_location.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_text_field.dart';
import 'package:property_app/views/addPropertyView/widget/add_prperty_drop_down_button.dart';

class AddProperty1 extends StatefulWidget {
  const AddProperty1({Key? key}) : super(key: key);

  @override
  State<AddProperty1> createState() => _AddProperty1State();
}

class _AddProperty1State extends State<AddProperty1> {
  List<String> items = [
    'Select Type',
    'Sale',
    'Rent',
  ];

  String? value = 'Select Type';

  double val = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddPropertyTextField(name: 'Building Name  ', num: false),
        const AddPropertyTextField(name: 'Property Number  ', num: true),
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
          cursorColor: Color1.primaryColor,
        ),
        const AddPropertyLocation(
          add: true,
        ),
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
              child: Slider(
                min: 0,
                max: 700,
                divisions: 140,
                activeColor: Color1.primaryColor,
                value: val,
                label: val.toInt().toString(),
                onChanged: (value) {
                  setState(() {
                    val = value;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              'Property Kind',
              style: Style.textStyle18.copyWith(color: Color1.primaryColor),
            ),
            const SizedBox(
              width: 75,
            ),
            const AddPropertyDropDownButton(),
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
            )
          ],
        )
      ],
    );
  }
}
