import 'package:flutter/material.dart';
import 'package:property_app/Core/style.dart';
class propertydescription extends StatelessWidget {
  const propertydescription({Key? key, required this.text, required this.number, required this.icon}) : super(key: key);
  final String text;
  final dynamic number;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.all(8),
        width: 170,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            Text(
              text,
              style: Style.textStyle20.copyWith(color: Colors.white),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Center(
                child: Text(
                  '$number',
                  style: Style.textStyle18.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
