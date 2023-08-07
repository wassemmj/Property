import 'package:flutter/material.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/views/showMoreView/widget/show_more_image.dart';
import 'package:property_app/views/showMoreView/widget/show_more_row.dart';

import '../../PropertyDetailsView/property_details_view.dart';

class ShowMoreCard extends StatelessWidget {
  const ShowMoreCard({Key? key, required this.location, required this.id}) : super(key: key);

  final String location;
  final int id;

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> PropertyDetailsView(id: id)));
      },
      child: Stack(
        children: [
          Container(
            height: (height/3.6).floorToDouble(),
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: const [
                      ShowMoreImage(),
                    ],
                  ),
                ),
                Expanded(
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
                              text: location,
                              size: (height/48).floorToDouble(),
                            ),
                            ShowMoreRow(
                              icon: Icons.monetization_on_outlined,
                              color: const Color.fromRGBO(80, 82, 82, 0.7),
                              text: '500 M',
                              size: (height/48).floorToDouble(),
                            ),
                            ShowMoreRow(
                              icon: Icons.star,
                              color: Colors.yellow,
                              text: '4.8 /5',
                              size: (height/48).floorToDouble(),
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