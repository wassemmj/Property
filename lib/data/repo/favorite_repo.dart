import 'dart:convert';

import 'package:property_app/data/api/favorite_api.dart';

class FavoriteRepo {
  static Future addFav(int id) async {
    try {
      print('start repo');
      var response = await FavoriteApi.addFav(id);
      print('end repo');
      return response;
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future delFav(int id) async {
    try {
      print('start repo');
      var response = await FavoriteApi.delFav(id);
      print('end repo');
      return response;
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future getFav() async {
    try {
      print('start repo');
      var response = await FavoriteApi.getFav();
      print('end repo');
      if(response == 'you dont have any favourite adverts') {
        return [];
      }
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }
}