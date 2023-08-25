import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/logic/property_image_cubit/property_image_cubit.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  File? pickedImage;

  List<File> selectedImages = [];
  var e = TextEditingController();
  final picker = ImagePicker();
  List ee = [];

  List<String> items = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  String? value = '0';


  @override
  Widget build(BuildContext context) {
    int height = MediaQuery
        .of(context)
        .size
        .height
        .toInt();
    int valuee = int.parse(value!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        title: Text(
          'add image property',
          style: Style.textStyle22.copyWith(
              fontSize: (height / 36).floorToDouble(),
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color1.primaryColor,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Column(
                children: [
                  // Container(
                  //     padding: const EdgeInsets.all(15),
                  //     alignment: Alignment.center,
                  //     decoration: const BoxDecoration(
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Stack(
                  //       children: [
                  //         ClipOval(
                  //           child: SizedBox.fromSize(
                  //             size: const Size.fromRadius(75),
                  //             child: pickedImage == null
                  //                 ? Image.asset(
                  //               'assets/images/i.png',
                  //               fit: BoxFit.cover,
                  //             )
                  //                 : Image.file(
                  //               pickedImage!,
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),
                  //         Container(
                  //           decoration: BoxDecoration(
                  //             color: Colors.white38,
                  //             borderRadius: BorderRadius.circular(50),
                  //           ),
                  //           child: IconButton(
                  //             onPressed: () async {
                  //               final ImagePicker picker = ImagePicker();
                  //               final XFile? image =
                  //               await picker.pickImage(
                  //                 source: ImageSource.camera,
                  //               );
                  //               if (image == null) {
                  //                 return;
                  //               }
                  //               setState(() {
                  //                 pickedImage = File(image.path);
                  //               });
                  //             },
                  //             style: ButtonStyle(
                  //               backgroundColor:
                  //               MaterialStateProperty.all(
                  //                   Color1.primaryColor),
                  //             ),
                  //             icon: const Icon(
                  //               Icons.add,
                  //               color: Color1.primaryColor,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     )),
                  SizedBox(
                    width: 300.0,
                    child: selectedImages.isEmpty
                        ? const Center(child: Text('Sorry nothing selected!!'))
                        : GridView.builder(
                      shrinkWrap: true,
                      itemCount: selectedImages.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3
                        // Horizontally only 3 images will show
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // TO show selected file
                        return Center(
                            child: kIsWeb
                                ? Image.network(
                                selectedImages[index].path)
                                : Image.file(selectedImages[index]));
                        // If you are making the web app then you have to
                        // use image provider as network image or in
                        // android or iOS it will as file only
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green)),
                    child: const Text('Select Image from Gallery'),
                    onPressed: () {
                      getImages();
                    },
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: selectedImages.length,
                      itemBuilder: (context, index) {
                        return TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'description   ',
                            hintStyle: Style.textStyle18,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color1.primaryColor,
                                  width: 1,
                                )),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color1.primaryColor,
                                  width: 1,
                                )),
                          ),
                          cursorColor: Color1.primaryColor,
                          // controller: e,
                          onFieldSubmitted: (value) {
                            print(value);
                            ee.add(value);
                          },
                        ) ;
                      },
                    ),
                  ),
                  BlocBuilder<PropertyImageCubit, PropertyImageState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () async {
                            for(int i= 0;i<selectedImages.length;i++) {
                              // await BlocProvider.of<PropertyImageCubit>(context)
                              //     .addFav(widget.id, ee[i], selectedImages[i],
                              //     int.parse(value!) == 1 ? true : false);
                              await BlocProvider.of<PropertyImageCubit>(context)
                                  .addFav(widget.id, ee[i], selectedImages[i],
                                  int.parse(value!) == 1 ? true : false);
                            }
                            print(widget.id);
                            print(ee);
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('photos added successfully')));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color1.primaryColor),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                          ),
                          child: const Text('add this image'));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        backgroundColor: Color1.primaryColor.withOpacity(0.7),
        child: const Icon(
          Icons.check,
          color: Color1.white,
        ),
      ),
    );
  }


  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100,
        maxHeight: 1000,
        maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
      setState(
            () {  },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')));
    }

  }
}
