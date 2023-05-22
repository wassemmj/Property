import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/color1.dart';
import '../../../logic/login_cubit/login_cubit.dart';

class LoginButton1 extends StatelessWidget {
  const LoginButton1(
      {Key? key,
      required this.formKey,
      required this.index,
      required this.onPressed})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  final int index;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if(state.status == LoginStatus.loading) {
          return const CircularProgressIndicator(
            color: Color1.primaryColor,
            strokeWidth: 1,
          );
        }
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color1.primaryColor),
            foregroundColor: MaterialStateProperty.all(Color1.white),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          child: Text(
                  index == 1
                      ? 'Log in'.toUpperCase()
                      : 'Register'.toUpperCase(),
                ),
        );
      },
    );
  }
}
