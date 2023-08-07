import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/core/id.dart';
import 'package:property_app/logic/profile_cubit/profile_cubit.dart';
import 'package:property_app/views/addPropertyView/widget/add_property_location.dart';
import 'package:property_app/views/profileView/widget/profile_image.dart';
import 'package:property_app/views/profileView/widget/profile_text1.dart';
import 'package:property_app/views/profileView/widget/profile_text2.dart';
import 'package:property_app/views/profileView/widget/profile_text_field.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key, required this.id, required this.home}) : super(key: key);

  final int id;
  final bool home;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool edit = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String phoneCo = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ProfileCubit>(context,listen: false).pro(widget.id==0 ?Id.id : widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    int width = MediaQuery.of(context).size.width.toInt();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color1.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: Style.textStyle22.copyWith(
              fontSize: (height / 36).floorToDouble(),
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: !widget.home ? IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color1.primaryColor,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ): const Icon(Icons.house),
        actions: [
          !edit
              ? Row(
                  children: [
                    const Icon(
                      Icons.star_rate,
                      color: Colors.yellow,
                      size: 27,
                    ),
                    SizedBox(width: (width / 205).floorToDouble()),
                    Text(
                      '4.5 / 5',
                      style: Style.textStyle16.copyWith(color: Color1.black),
                    ),
                    SizedBox(width: (width / 51).floorToDouble()),
                  ],
                )
              : Container(),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if(state.status == ProfileStatus.loading||state.status == ProfileStatus.initial) {
            return const Center(child: CircularProgressIndicator(color: Color1.primaryColor,strokeWidth: 1,));
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                ProfileImage(edit: edit),
                SizedBox(
                    height: edit
                        ? (height / 86.7).floorToDouble()
                        : (height / 14.4).floorToDouble()),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      !edit
                          ? ProfileText1(
                              text: 'Name',
                              ans: state.pro['name'],
                            )
                          : ProfileTextField(
                              controller: nameController,
                              text: 'name',
                              phone: false,
                              onNumberChanged: (phoneNumber) {},
                            ),
                      SizedBox(height: (height / 28.9).floorToDouble()),
                      ProfileText2(
                        text: 'Email',
                        ans: state.pro['email'],
                      ),
                      SizedBox(height: (height / 28.9).floorToDouble()),
                      !edit
                          ? ProfileText1(
                              text: 'Phone Number',
                              ans: state.pro['phone_number']?? 'No Phone Number',
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
                      SizedBox(height: (height / 28.9).floorToDouble()),
                      !edit
                          ? const ProfileText1(
                              text: 'Subscription', ans: 'No Subscription')
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: widget.home? FloatingActionButton(
        onPressed: () {
          setState(() {
            edit = !edit;
          });
        },
        backgroundColor: Color1.primaryColor,
        foregroundColor: Color1.white,
        child: Icon(!edit ? Icons.edit : Icons.done),
      ):Container(),
    );
  }
}
