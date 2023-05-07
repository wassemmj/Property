import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:property_app/Core/api.dart';

class LoginApi {
  static Future loginAuth(String email,String password) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/login'),
        headers: {
          'Accept':'application/json',
        },
        body: {
          'email': email,
          'password': password,
        },
      );
      if(response.statusCode != 201) {
        throw Exception('error occurred');
      } else {
        return response.body;
      }
    } catch(error) {
      print(error.toString());
    }
  }
}