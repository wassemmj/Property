import 'package:flutter/material.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_location.dart';
import 'package:property_app/views/profileView/widget/profile_image.dart';
import 'package:property_app/views/profileView/widget/profile_text1.dart';
import 'package:property_app/views/profileView/widget/profile_text2.dart';
import 'package:property_app/views/profileView/widget/profile_text_field.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool edit = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String phoneCo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: Style.textStyle22
              .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: !edit
            ? Row(
                children: [
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.house_outlined,
                    color: Color1.primaryColor,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    '15',
                    style: Style.textStyle16.copyWith(color: Color1.black),
                  )
                ],
              )
            : null,
        actions: [
          !edit
              ? Row(
                  children: [
                    const Icon(
                      Icons.star_rate,
                      color: Colors.yellow,
                      size: 27,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '4.5 / 5',
                      style: Style.textStyle16.copyWith(color: Color1.black),
                    ),
                    const SizedBox(width: 8),
                  ],
                )
              : Container(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImage(edit: edit),
            SizedBox(height: edit ? 10 : 60),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  !edit
                      ? const ProfileText1(
                          text: 'Name',
                          ans: 'Mahmoud Nasser',
                        )
                      : ProfileTextField(
                          controller: nameController,
                          text: 'name',
                          phone: false,
                          onNumberChanged: (phoneNumber) {},
                        ),
                  const SizedBox(height: 30),
                  !edit
                      ? const ProfileText2(
                          text: 'Email',
                          ans: 'mahmoud.nas205@gmail.com',
                        )
                      : ProfileTextField(
                          controller: emailController,
                          text: 'Email',
                          phone: false,
                          onNumberChanged: (phoneNumber) {},
                        ),
                  const SizedBox(height: 30),
                  !edit
                      ? const ProfileText2(
                          text: 'Location',
                          ans: 'Syria, Damascus , Afif, Haroon Rashid')
                      : const AddPropertyLocation(
                          add: false,
                        ),
                  const SizedBox(height: 30),
                  !edit
                      ? const ProfileText1(
                          text: 'Phone Number',
                          ans: 'No Phone Number',
                        )
                      : ProfileTextField(
                          controller: TextEditingController(),
                          text: 'Phone Number',
                          phone: true,
                          onNumberChanged: (val) {
                            setState(() {
                              phoneCo = val.completeNumber;
                            });
                          },
                        ),
                  const SizedBox(height: 30),
                  !edit
                      ? const ProfileText1(
                          text: 'Subscription', ans: 'No Subscription')
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            edit = !edit;
          });
        },
        backgroundColor: Color1.primaryColor,
        foregroundColor: Color1.white,
        child: Icon(!edit ? Icons.edit : Icons.done),
      ),
    );
  }
}
