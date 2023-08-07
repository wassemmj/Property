import 'dart:convert';

import '../api/all_property_api.dart';

class AllPropertyRepo {
  static Future allProperty() async {
    try {
      var response = await AllPropertyApi.allPropertyAuth();
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future cat() async {
    try {
      var response = await AllPropertyApi.cat();
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future type(String name) async {
    try {
      var response = await AllPropertyApi.type(name);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}