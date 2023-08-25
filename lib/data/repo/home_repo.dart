import 'dart:convert';

import 'package:property_app/data/api/home_api.dart';

class HomeRepo {
  static Future getTop() async {
    try {
      print('start repo');
      var response = await HomeApi.getTop();
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future search(String query) async {
    try {
      print('start repo');
      var response = await HomeApi.search(query);
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future getRandom() async {
    try {
      print('start repo');
      var response = await HomeApi.getRandom();
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }
}