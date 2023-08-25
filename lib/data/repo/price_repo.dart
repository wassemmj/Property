import 'dart:convert';

import '../api/price_api.dart';

class PriceRepo {
  static Future detail(int space, String coun,String city, String n,bool s,bool sup,bool lux,bool ind,bool heat) async {
    try {
      var response = await PriceApi.detail(space, coun, city, n, s, sup, lux, ind, heat);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}