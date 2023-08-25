import 'dart:convert';

import 'package:property_app/data/api/wallet_api.dart';

class WalletRepo {
  static Future get() async {
    try {
      print('start repo');
      var response = await WalletApi.get();
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future add(String balance,String type,String password) async {
    try {
      print('start repo');
      var response = await WalletApi.add(balance, type, password);
      print(response);

      return response;
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }
}