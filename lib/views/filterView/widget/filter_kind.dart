import 'package:flutter/material.dart';

import '../../../Core/color1.dart';

class FilterKind extends StatelessWidget {
  const FilterKind({Key? key, required this.kind, required this.isSelected}) : super(key: key);

  final String kind;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 4,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Color1.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? Color1.primaryColor
                : Colors.grey,
            width: 2,
          ),
        ),
        child: Text(
          kind,
          style: TextStyle(
            color: isSelected
                ? Color1.primaryColor
                : Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
