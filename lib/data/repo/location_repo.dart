import 'dart:convert';

import 'package:property_app/data/api/location_api.dart';

class LocationRepo {
  static Future pro() async {
    try {
      print('start repo');
      var response = await LocationApi.pro();
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }
}