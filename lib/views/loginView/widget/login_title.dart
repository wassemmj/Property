import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Core/style.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        'Welcome'.toUpperCase(),
        style: GoogleFonts.lato(
          textStyle: Style.textStyle32,
        ),
      );
  }
}
