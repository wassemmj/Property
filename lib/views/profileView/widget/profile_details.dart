import 'package:flutter/material.dart';
import 'package:property_app/views/profileView/widget/profile_text1.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: const [
          ProfileText1(text: 'My Property :', ans: '15'),
          SizedBox(width: 60),
          ProfileText1(text: 'done :', ans: '5'),
        ],
      );
  }
}
