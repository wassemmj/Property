import 'package:flutter/material.dart';

import '../../../Core/color1.dart';
import '../../showMoreView/show_more_view.dart';

class ExploreLastItem extends StatelessWidget {
  const ExploreLastItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ShowMoreView(),)),
      child: Container(
        width: 100,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color1.primaryColor.withOpacity(0.8),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(15)),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.arrow_circle_right,
              color: Color1.white,
            ),
            Text(
              'More Property',
              style: TextStyle(
                color: Color1.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
