import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_app/logic/profile_cubit/profile_cubit.dart';

import '../../Core/color1.dart';
import '../../Core/style.dart';
import '../profileView/profile_view.dart';
import '../propertyDetailsView/widget/property_owner.dart';

class FollowView extends StatefulWidget {
  const FollowView({Key? key}) : super(key: key);

  @override
  State<FollowView> createState() => _FollowViewState();
}

class _FollowViewState extends State<FollowView> {
  List fav = [];
  var seList = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ProfileCubit>(context, listen: false)
          .getFavAccount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state.status == ProfileStatus.loading ||
                state.status == ProfileStatus.initial) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
            }
            if (BlocProvider.of<ProfileCubit>(context).favAccount == null) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color1.primaryColor,
                strokeWidth: 1,
              ));
            }
            fav = BlocProvider.of<ProfileCubit>(context).favAccount;
            var lll = ['following', 'follower'];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
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
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Follow',
                        style: Style.textStyle22.copyWith(
                            fontSize: (height / 34.3).floorToDouble(),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: (height / 17.3).floorToDouble(),
                  child: ListView.builder(
                    itemCount: lll.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            seList = index;
                          });
                          if(seList==0) {
                            await BlocProvider.of<ProfileCubit>(context, listen: false)
                                .getFavAccount();
                          } else {
                            await BlocProvider.of<ProfileCubit>(context, listen: false)
                                .getFolAccount();
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: seList == index
                                ? Color1.primaryColor
                                : Color1.white,
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.3,
                              ),
                            ),
                          ),
                          child: Text(
                            lll[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: seList == index
                                  ? Color1.white
                                  : Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    fav.isNotEmpty
                        ? Container()
                        : SizedBox(
                            height: (height / 2.477).floorToDouble(),
                          ),
                    fav.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Flexible(
                              child: ListView.builder(
                                  itemCount: fav.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return PropertyOwner(
                                      id: fav[index]["id"],
                                      name: fav[index]['name'],
                                      email: fav[index]['email'],
                                      phone: fav[index]['phone_number'] ??
                                          'No Phone Number',
                                      f: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProfileView(
                                                            id: fav[index]['id'],
                                                            home: false),
                                                  ));
                                                },
                                                child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.person,
                                                      color: Color1.primaryColor,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'show profile',
                                                      style: Style.textStyle20,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      color: Colors.black26,
                                    );
                                  }),
                            ),
                          )
                        : const Center(
                            child: Text(
                              'There is not any favorites user,',
                              textAlign: TextAlign.center,
                              style: Style.textStyle16,
                            ),
                          ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
