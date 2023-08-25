import 'package:flutter/material.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/core/style.dart';
import 'package:property_app/views/showMoreView/widget/show_more_card.dart';

class ShowMoreView extends StatelessWidget {
  const ShowMoreView({Key? key, required this.l}) : super(key: key);

  final List l;

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
      body: Builder(
        builder: (context) {
          return ListView.builder(
            itemCount:  l.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var ll = l[index];
              var p = ll['advert']['advertable'];
              return ShowMoreCard(
                location: '${ll['location']['country']} , ${ll['location']['city']} ',
                id: ll['id']??0,
                price: ll['advert']['advertable_type']=='App\\Models\\Rent'? '${p['price_per_day']} per day':'${p['total_price']} ',
                rent: ll['advert']['advertable_type']=='App\\Models\\Rent'? true:false,
                space: '${ll['space']} M',
                // image: ll['image'],
              );
            },
          );
        }
      ),
    );
  }
}
