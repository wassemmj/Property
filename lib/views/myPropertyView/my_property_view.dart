import 'package:flutter/material.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';
import '../showMoreView/widget/show_more_card.dart';

class MyPropertyView extends StatefulWidget {
  const MyPropertyView({Key? key}) : super(key: key);

  @override
  State<MyPropertyView> createState() => _MyPropertyViewState();
}

class _MyPropertyViewState extends State<MyPropertyView> {
  List myProperty = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        title: Text(
          'My Property',
          style: Style.textStyle22
              .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Color1.primaryColor,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            myProperty.isNotEmpty
                ? Container()
                : const SizedBox(
              height: 350,
            ),
            myProperty.isNotEmpty
                ? Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ShowMoreCard();
                  }),
            )
                : const Center(
              child: Text(
                'There is not any property,\n Add Some Property',
                textAlign: TextAlign.center,
                style: Style.textStyle16,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: myProperty.isEmpty
          ? FloatingActionButton(
        onPressed: () {},
        tooltip: 'add some property to application',
        backgroundColor: Color1.primaryColor.withOpacity(0.7),
        child: const Icon(
          Icons.home_outlined,
          color: Color1.white,
        ),
      )
          : null,
    );
  }
}
