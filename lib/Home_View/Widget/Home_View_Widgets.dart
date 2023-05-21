import 'package:flutter/material.dart';

import '../../views/PropertyDetailsView/Widget/Property_Details_View.dart';

class Home_View_Widgets extends StatelessWidget {
  const Home_View_Widgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                        'assets/images/logo.jpg',
                      ),
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                 IconButton(onPressed: (){}, icon:const Icon(Icons.search_outlined)),

                ],
              ),
            ],
          ),
          SizedBox(height:10,),

          Text(
            'Our Promise',
            style: TextStyle(color: Colors.blueAccent, fontSize: 16),
          ),
          SizedBox(height:15,),

          const Text(
            'The perfect choice for ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const Text(
            'your future ',
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
          // Image(image: AssetImage('assets/images/img_5.png'),height: 200,width: MediaQuery.of(context).size.width,),

          SizedBox(
            height: 30,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Proberty_Details_View()));
                },
                child: const HomeContainers(
                  seconds: 2,
                  text: 'Home',
                  imagepath: 'assets/images/img_8.png',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: const HomeContainers(
                  seconds: 2,
                  text: 'Villa',
                  imagepath: 'assets/images/img_10.png',
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
                onTap: () {},
                child: const HomeContainers(
                  seconds: 2,
                  text: 'Apartment',
                  imagepath: 'assets/images/img_5.png',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: const HomeContainers(
                  seconds: 2,
                  text: 'Others',
                  imagepath: 'assets/images/img_11.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeContainers extends StatelessWidget {
  const HomeContainers({
    Key? key,
    required this.seconds,
    required this.text,
    required this.imagepath,
  }) : super(key: key);
  final int seconds;
  final String imagepath;
  final String text;

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;

    return Container(
      width: screenwidth / 2.6,
      height: screenheight / 9.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color.fromRGBO(80, 82, 82, 0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ),
          Container(
            height: screenheight / 5.4,
            width: screenwidth / 5.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  '$imagepath',
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
