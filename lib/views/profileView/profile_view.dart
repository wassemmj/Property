import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/Core/style.dart';
import 'package:property_app/logic/profile_cubit/profile_cubit.dart';
import 'package:property_app/views/loginView/login_view.dart';
import 'package:property_app/views/profileView/widget/profile_text1.dart';
import 'package:property_app/views/profileView/widget/profile_text2.dart';
import 'package:property_app/views/profileView/widget/profile_text_field.dart';

import '../../Core/api.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
    required this.id,
    required this.home,
  }) : super(key: key);

  final int id;
  final bool home;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool edit = false;
  bool f = false;
  File? pickedImage;
  String phoneCo = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      widget.home
          ? await BlocProvider.of<ProfileCubit>(context, listen: false)
              .pro(widget.id)
          : await BlocProvider.of<ProfileCubit>(context, listen: false)
              .pro1(widget.id);
    });
    super.initState();
    getd();
  }

  getd() async {
    await BlocProvider.of<ProfileCubit>(context).getFavAccount();
    f = BlocProvider.of<ProfileCubit>(context).favAccount.any((expert) {
      print(expert['id']);
      return widget.id == expert['id'];
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await BlocProvider.of<ProfileCubit>(context).getFavAccount();
    // fav =  Provider.of<ApiProvider>(context, listen: false).isMealFavorites(id);
    if (f) {
      await BlocProvider.of<ProfileCubit>(context).follow(widget.id);
      setState(() {
        f = true;
      });
    } else {
      setState(() {
        f = false;
      });
      await BlocProvider.of<ProfileCubit>(context).unfollow(widget.id);
    }
  }

  var name = TextEditingController();
  var password = TextEditingController();
  var co = TextEditingController();
  var fd = TextEditingController();
  var d = TextEditingController();
  var num = TextEditingController();
  var t = TextEditingController();

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
        leading: !widget.home
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color1.primaryColor,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              )
            : BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 28,
                    ),
                    onPressed: () async {
                      await BlocProvider.of<ProfileCubit>(context).delete();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginView(),));
                    },
                  );
                },
              ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.status == ProfileStatus.loading ||
              state.status == ProfileStatus.initial) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ));
          }
          if (BlocProvider.of<ProfileCubit>(context).proo == null) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color1.primaryColor,
              strokeWidth: 1,
            ));
          }
          if (widget.home) {
            if (BlocProvider.of<ProfileCubit>(context).proo == null) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
            } else if (BlocProvider.of<ProfileCubit>(context).ess == null) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
            }
          }
          var pro = BlocProvider.of<ProfileCubit>(context).proo;
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
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
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 8.67),
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: edit
                                  ? Stack(
                                      children: [
                                        ClipOval(
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(50),
                                            child: pickedImage == null
                                                ?  Image.asset(
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
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: IconButton(
                                            onPressed: () async {
                                              final ImagePicker picker =
                                                  ImagePicker();
                                              final XFile? image =
                                                  await picker.pickImage(
                                                source: ImageSource.camera,
                                              );
                                              if (image == null) {
                                                return;
                                              }
                                              setState(() {
                                                pickedImage = File(image.path);
                                              });
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color1.primaryColor),
                                            ),
                                            icon: const Icon(
                                              Icons.add,
                                              color: Color1.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : widget.home
                                      ? ClipOval(
                                          child: SizedBox.fromSize(
                                          size: const Size.fromRadius(50),
                                          child: BlocProvider.of<ProfileCubit>(
                                                          context)
                                                      .image !=
                                                  null
                                              ? Image.network(
                                                  '${Api.apiServer.substring(0, 23)}/${BlocProvider.of<ProfileCubit>(context).image.substring(63)}',
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  'assets/images/i.png',
                                                  fit: BoxFit.cover,
                                                ),
                                        ))
                                      : ClipOval(
                                          child: SizedBox.fromSize(
                                              size: const Size.fromRadius(50),
                                              child: Image.asset(
                                                'assets/images/i.png',
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: !edit
                      ? Align(
                          child: Text(
                            pro['description'] ?? 'No description',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color1.black,
                                fontSize: 16),
                          ),
                        )
                      : ProfileTextField(
                          controller: d,
                          text: pro['description'] ?? 'description',
                          phone: false,
                          onNumberChanged: (val) {},
                        ),
                ),
                SizedBox(
                    height: edit
                        ? (height / 86.7).floorToDouble()
                        : (height / 36.4).floorToDouble()),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      // !edit
                      //     ? widget.home ? ProfileText1(
                      //         text: 'Followers',
                      //         ans: '${(BlocProvider.of<ProfileCubit>(context).c).length}' ??
                      //             0.toString(),
                      //       ) : Container()
                      //     : Container(),
                      // widget.home ? SizedBox(height: (height / 28.9).floorToDouble()):Container(),
                      !edit
                          ? ProfileText1(
                              text: 'Name',
                              ans: pro['name'],
                            )
                          : ProfileTextField(
                              controller: name,
                              text: pro['name'] ?? 'name',
                              phone: false,
                              onNumberChanged: (phoneNumber) {},
                            ),
                      SizedBox(height: (height / 28.9).floorToDouble()),
                      !edit
                          ? ProfileText2(
                              text: 'Email',
                              ans: pro['email'],
                            )
                          : Container(),
                      edit
                          ? Container()
                          : SizedBox(height: (height / 28.9).floorToDouble()),
                      !edit
                          ? Container()
                          : ProfileTextField(
                              controller: password,
                              text: 'password',
                              phone: false,
                              onNumberChanged: (val) {},
                            ),
                      !edit
                          ? Container()
                          : SizedBox(height: (height / 28.9).floorToDouble()),
                      !edit
                          ? Container()
                          : ProfileTextField(
                              controller: co,
                              text: 'password confirmation',
                              phone: false,
                              onNumberChanged: (val) {},
                            ),
                      !edit
                          ? Container()
                          : SizedBox(height: (height / 28.9).floorToDouble()),
                      !edit
                          ? ProfileText1(
                              text: 'Phone Number',
                              ans: pro['phone_number'] ?? 'No Phone Number',
                            )
                          : ProfileTextField(
                              controller: num,
                              text: pro['phone_number'] ?? 'Phone Number',
                              phone: true,
                              onNumberChanged: (val) {
                                setState(() {
                                  phoneCo = val.number;
                                });
                              },
                            ),
                      SizedBox(height: (height / 28.9).floorToDouble()),
                      !edit
                          ? ProfileText1(
                              text: 'Facebook url',
                              ans: pro['facebook_url'] ?? 'No FaceBook Url',
                            )
                          : ProfileTextField(
                              controller: fd,
                              text: pro['facebook_url'] ?? 'Facebook url',
                              phone: false,
                              onNumberChanged: (val) {},
                            ),
                      SizedBox(height: (height / 28.9).floorToDouble()),
                      !edit
                          ? ProfileText1(
                              text: 'twitter url',
                              ans: pro['twitter_url'] ?? 'No Twitter Url',
                            )
                          : ProfileTextField(
                              controller: t,
                              text: pro['twitter_url'] ?? 'twitter url',
                              phone: false,
                              onNumberChanged: (val) {},
                            ),
                      SizedBox(height: (height / 28.9).floorToDouble()),
                      !edit
                          ? ProfileText1(
                              text: 'Subscription', ans: pro['state'])
                          : Container(),
                      widget.home
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    !edit
                                        ? ProfileText1(
                                            text: 'advert ',
                                            ans: BlocProvider.of<ProfileCubit>(
                                                    context)
                                                .ess['myAdverts']
                                                .toString())
                                        : Container(),
                                    !edit
                                        ? ProfileText1(
                                            text: 'my request',
                                            ans: BlocProvider.of<ProfileCubit>(
                                                    context)
                                                .ess['myRequest']
                                                .toString())
                                        : Container(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    !edit
                                        ? ProfileText1(
                                            text: 'acceptedRequest',
                                            ans: BlocProvider.of<ProfileCubit>(
                                                    context)
                                                .ess['acceptedRequest']
                                                .toString())
                                        : Container(),
                                    !edit
                                        ? ProfileText1(
                                            text: 'dipositAmount',
                                            ans: BlocProvider.of<ProfileCubit>(
                                                    context)
                                                .ess['dipositAmount']
                                                .toString())
                                        : Container(),
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      !edit
                                          ? ProfileText1(
                                              text: 'expenses',
                                              ans:
                                                  BlocProvider.of<ProfileCubit>(
                                                          context)
                                                      .ess['expenses']
                                                      .toString())
                                          : Container(),
                                    ]),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: widget.home
          ? FloatingActionButton(
              onPressed: () async {
                if (edit) {
                  if (pickedImage != null) {
                    if (BlocProvider.of<ProfileCubit>(context).image == null) {
                      await BlocProvider.of<ProfileCubit>(context)
                          .createImage(pickedImage!, false);
                    } else {
                      await BlocProvider.of<ProfileCubit>(context)
                          .createImage(pickedImage!, true);
                    }
                  }
                  if (name.text.isNotEmpty &
                      password.text.isNotEmpty &
                      co.text.isNotEmpty &
                      phoneCo.toString().isNotEmpty &
                      fd.text.isNotEmpty &
                      t.text.isNotEmpty &
                      d.text.isNotEmpty) {
                    await BlocProvider.of<ProfileCubit>(context).put(
                        name.text,
                        password.text,
                        co.text,
                        phoneCo.toString(),
                        fd.text,
                        t.text,
                        d.text);
                  }
                }
                setState(() {
                  edit = !edit;
                });
                name.clear();
                password.clear();
                co.clear();
                num.clear();
                fd.clear();
                t.clear();
                d.clear();
              },
              backgroundColor: Color1.primaryColor,
              foregroundColor: Color1.white,
              child: Icon(!edit ? Icons.edit : Icons.done),
            )
          : FloatingActionButton(
              onPressed: () async {
                if (!f) {
                  await BlocProvider.of<ProfileCubit>(context)
                      .follow(widget.id);
                } else {
                  await BlocProvider.of<ProfileCubit>(context)
                      .unfollow(widget.id);
                }
                setState(() {
                  f = !f;
                });
              },
              backgroundColor: Color1.primaryColor,
              foregroundColor: Color1.white,
              child: Icon(!f ? Icons.favorite_border : Icons.favorite),
            ),
    );
  }
}

// await BlocProvider.of<ProfileCubit>(context)
//                                             .createImage(File(image.path));
