import 'package:flutter/material.dart';
import 'package:property_app/views/addPropertyView/widget/add_prperty_drop_down_button.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class AddPropertyLocation extends StatelessWidget {
  const AddPropertyLocation({Key? key, required this.add}) : super(key: key);

  final bool add;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        add
            ? Text(
                'Location',
                style: Style.textStyle18.copyWith(color: Color1.primaryColor),
              )
            : Text(
                "Location :",
                style: Style.textStyle22.copyWith(
                    fontWeight: FontWeight.w400, color: Color1.primaryColor),
              ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            AddPropertyDropDownButton(),
            AddPropertyDropDownButton(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            AddPropertyDropDownButton(),
            AddPropertyDropDownButton(),
          ],
        ),
      ],
    );
  }
}
