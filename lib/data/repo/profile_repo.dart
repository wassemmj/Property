import 'dart:convert';

import 'package:property_app/data/api/profile_api.dart';

class ProfileRepo {
  static Future pro(int id) async {
    try {
      var response = await ProfileApi.pro(id);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}