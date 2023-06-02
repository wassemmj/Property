import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../../Core/style.dart';

class FilterRangeSlider extends StatelessWidget {
  const FilterRangeSlider({Key? key, required this.text, required this.start, required this.end, required this.onChange}) : super(key: key);

  final String text;
  final double start;
  final double end;
  final Function(RangeValues) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
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
            values: RangeValues(start, end),
            activeColor: Color1.primaryColor.withOpacity(0.7),
            labels: RangeLabels(start.toInt().toString(),
                end.toInt().toString(),),
            onChanged: onChange,
          ),
        )
      ],
    );
  }
}
