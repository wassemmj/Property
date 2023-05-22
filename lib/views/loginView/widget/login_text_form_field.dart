import 'package:flutter/material.dart';

import '../../../Core/color1.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField(
      {Key? key,
      required this.label,
      required this.hint,
      required this.controller,
      required this.keyboardType,
      required this.obscure,
      required this.password,
      required this.bb,
      required this.valid})
      : super(key: key);

  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscure;
  final bool password;
  final Function() bb;
  final String? Function(String?) valid;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color1.primaryColor,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 18,
          color: Color1.primaryColor,
        ),
        hintText: hint,
        suffixIcon: password
            ? IconButton(
                icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                color: Color1.primaryColor,
                onPressed: bb,
              )
            : null,
      ),
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscure,
      validator: valid,
    );
  }
}
