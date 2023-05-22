import 'package:flutter/material.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';
import '../showMoreView/widget/show_more_card.dart';

class WaitingView extends StatefulWidget {
  const WaitingView({Key? key}) : super(key: key);

  @override
  State<WaitingView> createState() => _WaitingViewState();
}

class _WaitingViewState extends State<WaitingView> {
  List waitingProperty = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        title: Text(
          'waiting Property',
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
            waitingProperty.isNotEmpty
                ? Container()
                : const SizedBox(
              height: 350,
            ),
            waitingProperty.isNotEmpty
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
      floatingActionButton: waitingProperty.isEmpty
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
