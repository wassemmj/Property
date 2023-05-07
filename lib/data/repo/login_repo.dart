import 'dart:convert';

import 'package:property_app/data/api/login_api.dart';

class LoginRepo {
  static Future login(String email,String password) async {
    try {
      var response = await LoginApi.loginAuth(email,password);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future signup(String name,String email,String password,String coPassword) async {
    try {
      var response = await LoginApi.signupAuth(name, email, password, coPassword);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}