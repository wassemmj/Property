import 'dart:convert';

import 'package:property_app/data/Model/login_model.dart';
import 'package:property_app/data/api/login_api.dart';

class LoginRepo {
  static Future login(String email,String password) async {
    try {
      var rr = await LoginApi.loginAuth(email,password);
      var loginModel = LoginModel.fromJson(jsonDecode(rr));
      return loginModel;
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}