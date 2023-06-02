import 'package:flutter/material.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/views/PropertyDetailsView/Widget/property_description.dart';

class PropertyDetailsViewBody extends StatefulWidget {
  const PropertyDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PropertyDetailsViewBody> createState() =>
      _PropertyDetailsViewBodyState();
}

class _PropertyDetailsViewBodyState extends State<PropertyDetailsViewBody> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    String location = 'Midan qaaa';
    String type = 'Huge Villa';
    String price = '200k\$';
    String description =
        'Huge Villa for big family also have some facility others villas don\'t have Read more...';

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/img_1.png',
                  ),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color1.primaryColor,
                              size: 28,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              fav ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                              size: 28,
                            ),
                            onPressed: () {
                              setState(() {
                                fav = !fav;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 250),
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(80, 82, 82, 0.7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            type,
                            style:
                                Style.textStyle32.copyWith(color: Color1.white),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            location,
                            style:
                                Style.textStyle18.copyWith(color: Color1.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            description,
                            style:
                                Style.textStyle18.copyWith(color: Color1.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            PropertyDescription(
                              text: 'bedrooms',
                              number: 4,
                              icon: Icons.bed,
                            ),
                            PropertyDescription(
                              text: 'bathrooms',
                              number: 4,
                              icon: Icons.bathroom,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            PropertyDescription(
                              text: 'Parking',
                              number: 1,
                              icon: Icons.local_parking,
                            ),
                            PropertyDescription(
                              text: 'Big Garden',
                              number: 1,
                              icon: Icons.bed,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Property Owner',
                            style:
                                Style.textStyle20.copyWith(color: Color1.white),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(7),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white24,
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
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mahmoud Nasser',
                                    style: Style.textStyle20
                                        .copyWith(color: Color1.white),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'mahmoud.nas205@gmail.com',
                                    style: Style.textStyle18
                                        .copyWith(color: Color1.white),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '+963 988921569',
                                    style: Style.textStyle18
                                        .copyWith(color: Color1.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color1.primaryColor,
                          ),
                          child: Center(
                              child: Text(
                            price,
                            style:
                                Style.textStyle20.copyWith(color: Color1.white),
                          )),
                        ),
                        Text(
                          'Include all taxes',
                          style:
                              Style.textStyle18.copyWith(color: Colors.white70),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
