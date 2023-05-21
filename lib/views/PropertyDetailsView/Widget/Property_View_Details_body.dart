import 'package:flutter/material.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/views/PropertyDetailsView/Widget/propertydescription.dart';

class Property_Details_View_Body extends StatelessWidget {
  const Property_Details_View_Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String location = 'Midan qaaa';
    String tybe = 'Huge Villa';
    String garden = 'Big Garden';
    String bathrooms = 'bathrooms';
    String parking = 'Parking';
    String bedrooms = 'Bedrooms';
    String garednnumber = 'Bedrooms';
    String bedroomsnumber = 'Bedrooms';
    String bathroomsnumber = 'Bedrooms';
    bool isgarden = true;
    String price = '200k\$';
    String description = 'Huge Villa for big family also have some facility others villas don\'t have Read more...';

    const String testimage = 'assets/images/R.png';
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage(
                'assets/images/img_1.png',
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(80, 82, 82, 0.7),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          height: MediaQuery.of(context).size.height * 0.6,
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
                  tybe,
                  style: Style.textStyle32.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  location,
                  style: Style.textStyle18.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  description,
                  style: Style.textStyle18.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  propertydescription(
                    text: 'bedrooms',
                    number: 4,
                    icon: Icons.bed,
                  ),
                  propertydescription(
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
                  propertydescription(
                    text: 'Parking',
                    number: 1,
                    icon: Icons.local_parking,
                  ),
                  propertydescription(
                    text: 'Big Garden',
                    number: 1,
                    icon: Icons.bed,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueAccent,
                ),
                child: Center(
                    child: Text(
                  price,
                  style: Style.textStyle20.copyWith(color: Colors.white),
                )),
              ),
              Text('Include all taxes', style: Style.textStyle18.copyWith(color: Colors.white70))
            ],
          ),
        ),
      ],
    );
  }
}
