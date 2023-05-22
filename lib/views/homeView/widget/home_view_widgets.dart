import 'package:flutter/material.dart';
import 'package:property_app/views/awidget/main_drawer.dart';
import 'package:property_app/views/exploreView/explore_view.dart';
import 'package:property_app/views/showMoreView/show_more_view.dart';

import '../../../Core/color1.dart';
import 'home_containers.dart';

class HomeViewWidgets extends StatelessWidget {
  const HomeViewWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Our Promise',
                style: TextStyle(color: Color1.primaryColor, fontSize: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'The perfect choice for ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const Text(
                'The future ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
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
              const SizedBox(
                height: 30,
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
                  const SizedBox(
                    width: 10,
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
              const SizedBox(
                height: 15,
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
                  const SizedBox(
                    width: 10,
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
            ],
          ),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
