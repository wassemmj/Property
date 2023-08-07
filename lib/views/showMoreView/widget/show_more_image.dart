import 'package:flutter/material.dart';

class ShowMoreImage extends StatefulWidget {
  const ShowMoreImage({Key? key}) : super(key: key);

  @override
  State<ShowMoreImage> createState() => _ShowMoreImageState();
}

class _ShowMoreImageState extends State<ShowMoreImage> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:  const BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/apartment.jpg'),
            ),
          ),
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
    );
  }
}
