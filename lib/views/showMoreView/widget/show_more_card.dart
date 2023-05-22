import 'package:flutter/material.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/views/showMoreView/widget/show_more_image.dart';
import 'package:property_app/views/showMoreView/widget/show_more_row.dart';

import '../../PropertyDetailsView/property_details_view.dart';

class ShowMoreCard extends StatelessWidget {
  const ShowMoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const PropertyDetailsView()));
      },
      child: Stack(
        children: [
          Container(
            height: 240,
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      const ShowMoreImage(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          margin: EdgeInsets.symmetric(vertical: 2),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
                            color: Colors.white54,
                          ),
                          child: Text(
                            'Q2 Apartment',
                            style: Style.textStyle22.copyWith(color: Color1.primaryColor.withOpacity(0.7)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color1.primaryColor.withOpacity(0.2)),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(25))),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShowMoreRow(
                              icon: Icons.location_on,
                              color: Color1.primaryColor.withOpacity(0.8),
                              text: 'Malki,15 Street',
                              size: 18,
                            ),
                            const ShowMoreRow(
                              icon: Icons.star,
                              color: Colors.yellow,
                              text: '4.8 /5',
                              size: 18,
                            ),
                            const Text(
                              'Price: 5000\$',
                              style: Style.textStyle16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(top: 55, right: 50),
              child: const Banner(
                message: 'Sale',
                location: BannerLocation.bottomStart,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*
// return Container(
    //   // padding: const EdgeInsets.only(left: 10,bottom: 10),
    //   child: Card(
    //     elevation: 0,
    //     // shape: RoundedRectangleBorder(
    //     //   side: const BorderSide(
    //     //     color: Color1.primaryColor,
    //     //   ),
    //     //   borderRadius: BorderRadius.circular(50),
    //     // ),
    //     child: Container(
    //       decoration: const BoxDecoration(
    //         // border: Border(
    //         //   bottom: BorderSide(color: Color1.primaryColor,width: 1),
    //         //   left: BorderSide(color: Color1.primaryColor,width: 6),
    //         // )
    //       ),
    //       // padding: const EdgeInsets.only(left: 10),
    //       child: Row(
    //         children: [
    //           const ShowMoreImage(),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               // const ShowMoreText1(text: 'q1 apartment',style: Style.textStyle18,),
    //               // const SizedBox(height: 10),
    //               ShowMoreRow(icon: Icons.location_on, color: Color1.primaryColor.withOpacity(0.8), text: 'Malki,15 Street', size: 18),
    //               const SizedBox(height: 10),
    //               const Text('For Rent',style: TextStyle(color: Colors.red,fontSize: 16),),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
 */

/*
// return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20),
    //     color: Colors.black26,
    //   ),
    //   margin: const EdgeInsets.all(5),
    //   padding: const EdgeInsets.all(5),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const ShowMoreImage(),
    //       Column(
    //         children: [
    //           ShowMoreRow(
    //               icon: Icons.location_on,
    //               color: Color1.primaryColor.withOpacity(0.8),
    //               text: 'Malki,15 Street',
    //               size: 18,
    //           ),
    //           const SizedBox(height: 10),
    //           const Text(
    //             'For Rent',
    //             style: TextStyle(color: Colors.red, fontSize: 14),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
 */