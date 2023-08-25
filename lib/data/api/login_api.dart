import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:property_app/Core/api.dart';

class LoginApi {
  static String? message;
  
  static Future loginAuth(String email,String password) async {
    message = '';
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/login'),
        headers: {
          'Accept':'application/json',
        },
        body: {
          'email': email,
          'password': password,
          "type":"user",
        },
      );
      print(response.body);
      if(response.statusCode != 200) {
        var j = jsonDecode(response.body);
        message = j["message"];
        throw Exception('error occurred');
      } else {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        return response.body;
      }
    } catch(error) {
      rethrow;
    }
  }

  static Future logout() async {
    message = '';
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/login'),
        headers: {
          'Accept':'application/json',
        },
      );
      if(response.statusCode != 204) {
        var j = jsonDecode(response.body);
        message = j["message"];
        throw Exception('error occurred');
      } else {
        return response.body;
      }
    } catch(error) {
      rethrow;
    }
  }

  static Future signupAuth(String name,String email,String password,String coPassword) async {
    message = '';
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/signup'),
        headers: {
          'Accept':'application/json',
        },
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': coPassword,
        },
      );
      if(response.statusCode != 200 ){
        throw Exception('an error occurred');
      } else {
        if(response.body.isEmpty) {
          var j = jsonDecode(response.body);
          message = j["message"];
          throw Exception('empty');
        }
        return response.body;
      }
    } catch(error) {
      rethrow;
    }
  }
}