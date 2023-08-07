import 'package:flutter/material.dart';
import 'package:property_app/core/style.dart';
import 'package:property_app/views/awidget/main_drawer.dart';
import 'package:property_app/views/exploreView/explore_view.dart';
import 'package:property_app/views/showMoreView/show_more_view.dart';

import '../../../Core/color1.dart';
import 'home_containers.dart';

class HomeViewWidgets extends StatelessWidget {
  const HomeViewWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    int width = MediaQuery.of(context).size.width.toInt();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color1.primaryColor),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: height/86.toInt(),
              ),
              Text(
                'Our Promise',
                style: Style.textStyle16.copyWith(color: Color1.primaryColor),
              ),
              SizedBox(
                height: height/57.toInt(),
              ),
              Text(
                'The perfect choice for ',
                style: Style.textStyle22.copyWith(fontSize: (height/36).floorToDouble(), fontWeight: FontWeight.w500,color: Color1.black)
              ),
              Text(
                'The future ',
                  style: Style.textStyle22.copyWith(fontSize: (height/36).floorToDouble(), fontWeight: FontWeight.w500,color: Color1.black)
              ),
              SizedBox(
                height: height/57.toInt(),
              ),
              Container(
                height: height/3.toInt(),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      'assets/images/perspective-d-render-building-wireframe-vector-wireframe-city-background-image-building-perspective-d-render-112176156.jpg',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height/28.toInt(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ShowMoreView()));
                    },
                    child: const HomeContainers(
                      text: 'Home',
                      imagePath: 'assets/images/img_8.png',
                    ),
                  ),
                  SizedBox(
                    width: (width~/41).toDouble(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ShowMoreView()));
                    },
                    child: const HomeContainers(
                      text: 'Villa',
                      imagePath: 'assets/images/img_10.png',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height/57.toInt(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ShowMoreView()));
                    },
                    child: const HomeContainers(
                      text: 'Apartment',
                      imagePath: 'assets/images/img_5.png',
                    ),
                  ),
                  SizedBox(
                    width: (width~/41).toDouble(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ExploreView(from: true)));
                    },
                    child: const HomeContainers(
                      text: 'Others',
                      imagePath: 'assets/images/img_11.png',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height/57.toInt(),
              ),
              SizedBox(
                height: height/3.toInt(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Top Seller',
                          style:
                          Style.textStyle20.copyWith(color: Color1.black),
                        ),
                      ),
                      SizedBox(height: height/86.toInt()),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(7),
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromRGBO(80, 82, 82, 0.05),
                              ),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: SizedBox.fromSize(
                                        size: const Size.fromRadius(40),
                                        child: Image.asset(
                                          'assets/images/i.png',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(
                                    width: (width/13.7),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mahmoud Nasser',
                                        style: Style.textStyle20
                                            .copyWith(color: Color1.black),
                                      ),
                                      SizedBox(
                                        height: (height/173).floorToDouble(),
                                      ),
                                      Text(
                                        'mahmoud.nas205@gmail.com',
                                        style: Style.textStyle18
                                            .copyWith(color: Color1.black),
                                      ),
                                      SizedBox(
                                        height: (height/173).floorToDouble(),
                                      ),
                                      Text(
                                        '+963 988921569',
                                        style: Style.textStyle18
                                            .copyWith(color: Color1.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
