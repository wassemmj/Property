import 'package:flutter/material.dart';


import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_text_field.dart';

class AddProperty1 extends StatelessWidget {
  const AddProperty1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddPropertyTextField(name: 'Building Name  ', num: false),
        const AddPropertyTextField(name: 'Property Number  ', num: true),
        const AddPropertyTextField(name: 'Space  ', num: false),
        const AddPropertyTextField(name: 'Location  ', num: false),
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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
