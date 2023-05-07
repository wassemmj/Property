import 'package:flutter/material.dart';
import 'package:property_app/Core/color1.dart';
import 'package:property_app/views/loginView/Widget/login_buuton1.dart';
import 'package:property_app/views/loginView/Widget/login_text_form_field.dart';
import 'package:property_app/views/loginView/Widget/login_title.dart';

import 'Widget/login_button.dart';
import 'Widget/login_image.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  int index = 1;
  bool visible = false;
  bool visible1 = false;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final coPasswordController = TextEditingController();

  /* notes :)
  1 is login
  2 is register
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const LoginImage(),
                  const SizedBox(height: 25),
                  const LoginTitle(),
                  const SizedBox(height: 25),
                  optionPartFunction(),
                  const SizedBox(height: 50),
                  LoginTextFormField(
                    label: 'Email',
                    hint: 'Enter Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscure: true,
                    password: false,
                    bb: () {},
                    valid: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Email is required';
                      } else if (!val.isValidEmail()) {
                        return 'The Email is not Valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  LoginTextFormField(
                    label: 'Password',
                    hint: 'Enter Password',
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscure: !visible,
                    password: true,
                    bb: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    valid: (val) {
                      // RegExp regex = RegExp(
                      //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (val == null || val.isEmpty) {
                        return 'Password is required';
                      } else if (val.length < 8) {
                        return 'Short Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  index == 2
                      ? Column(
                          children: [
                            LoginTextFormField(
                              label: 'Confirm Password',
                              hint: 'Enter password confirmation',
                              controller: coPasswordController,
                              keyboardType: TextInputType.text,
                              obscure: !visible1,
                              password: true,
                              bb: () {
                                setState(() {
                                  visible1 = !visible1;
                                });
                              },
                              valid: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Password Confirmation is required';
                                } else if (val != passwordController.text) {
                                  return 'passwords don\'t match';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 25),
                          ],
                        )
                      : Container(),
                  LoginButton1(formKey: _formKey, index: index, onPressed: () {}),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onPressed() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                index == 1 ? 'LogIn Successfully' : 'Register Successfully')),
      );
      _formKey.currentState!.reset();
      emailController.clear();
      passwordController.clear();
      coPasswordController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('an error occurred')),
      );
    }
  }

  Widget optionPartFunction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginButton(
          fn: () {
            setState(() {
              setState(() {
                index = 1;
                visible = false;
                visible1 = false;
              });
              _formKey.currentState!.reset();
              emailController.clear();
              passwordController.clear();
              coPasswordController.clear();
            });
          },
          text: 'Login',
          roundedRectangleBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(30),
              bottomStart: Radius.circular(30),
            ),
          ),
          bacColor: index == 1 ? Color1.primaryColor : Color1.white,
          forColor: index == 1 ? Color1.white : Color1.primaryColor,
        ),
        LoginButton(
          fn: () {
            setState(() {
              index = 2;
              visible = false;
              visible1 = false;
            });
            _formKey.currentState!.reset();
            emailController.clear();
            passwordController.clear();
            coPasswordController.clear();
          },
          text: 'Register',
          roundedRectangleBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(30),
              bottomEnd: Radius.circular(30),
            ),
          ),
          bacColor: index == 2 ? Color1.primaryColor : Color1.white,
          forColor: index == 2 ? Color1.white : Color1.primaryColor,
        ),
      ],
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

/*
Text(
                    index == 1
                        ? 'or you can login with'
                        : 'or you can register with',
                    style: Style.textStyle16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.facebook,
                          color: Color1.primaryColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.phone),
                        onPressed: () {},
                      ),
                    ],
                  ),
 */
