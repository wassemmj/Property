import 'dart:convert';

import 'package:property_app/data/api/subscribe_api.dart';

class SubscribeRepo {
  static Future subscrribe(int id,String password) async {
    try {
      print('start repo');
      var response = await SubscribeApi.subscribe(id, password);
      print('end repo');
      return response;
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future get() async {
    try {
      print('start repo');
      var response = await SubscribeApi.get();
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }
}