import 'dart:convert';

import '../api/filter_api.dart';

class FilterRepo {
  static Future pro(String? country,String? city,String? ne,String? operation,String? name,String? type,String? space,String? mP,String? maP) async {
    try {
      print('start repo');
      var response = await FilterApi.pro(country, city, ne, operation, name, type, space, mP, maP);
      print('end repo');
      if(response == 'no result') {
        return response;
      }
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}