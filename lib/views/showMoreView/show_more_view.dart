import 'package:flutter/material.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/core/style.dart';
import 'package:property_app/views/showMoreView/widget/show_more_card.dart';

class ShowMoreView extends StatelessWidget {
  const ShowMoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apartment'.toUpperCase(),
          style: Style.textStyle22,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color1.primaryColor,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color1.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const ShowMoreCard();
        },
      ),
    );
  }
}
