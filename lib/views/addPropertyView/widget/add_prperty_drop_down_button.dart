import 'package:flutter/material.dart';

import '../../../Core/color1.dart';

class AddPropertyDropDownButton extends StatefulWidget {
  const AddPropertyDropDownButton({Key? key}) : super(key: key);

  @override
  State<AddPropertyDropDownButton> createState() => _AddPropertyDropDownButtonState();
}

class _AddPropertyDropDownButtonState extends State<AddPropertyDropDownButton> {
  List<String> items = [
    'Select Item',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String? dropdownvalue = 'Select Item';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      icon: const Icon(Icons.keyboard_arrow_down),
      value: dropdownvalue,
      onChanged: (val) {
        setState(() {
          dropdownvalue = val;
        });
      },
      iconEnabledColor: Color1.primaryColor,
    );
  }
}
