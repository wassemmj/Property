import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Core/color1.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key, required this.edit}) : super(key: key);

  final bool edit;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(250),
              bottomRight: Radius.circular(250),
            ),
            gradient: LinearGradient(
              colors: [
                Color1.primaryColor,
                Color1.primaryColor.withOpacity(0.5),
                Color1.white,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,

            ),
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: widget.edit? Stack(
                    children: [
                      ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(50),
                          child: pickedImage == null
                              ? Image.asset(
                            'assets/images/i.png',
                            fit: BoxFit.cover,
                          )
                              : Image.file(
                            pickedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (image == null) {
                              return;
                            }
                            setState(() {
                              pickedImage = File(image.path);
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color1.primaryColor),
                          ),
                          icon: const Icon(
                            Icons.add,
                            color: Color1.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ):ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(50),
                      child: Image.asset(
                        'assets/images/i.png',
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
