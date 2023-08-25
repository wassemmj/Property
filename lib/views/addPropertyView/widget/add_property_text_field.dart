import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class AddPropertyTextField extends StatelessWidget {
  const AddPropertyTextField({Key? key, required this.name, required this.num, required this.e}) : super(key: key);

  final String name;
  final bool num;
  final TextEditingController e;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: name,
            hintStyle: Style.textStyle18,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color1.primaryColor,
                  width: 1,
                )),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color1.primaryColor,
                  width: 1,
                )),
          ),
          cursorColor: Color1.primaryColor,
          controller: e,
          keyboardType: num? TextInputType.number:null,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
