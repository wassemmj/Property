import 'dart:math';

import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';

class WalletApi {
  static Future get() async{
    try {
      var response = await http.post(
          Uri.parse('${Api.apiServer}/user/getUserFinincialInfo'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Token.token}',
          },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        print(response.body);
        return response.body;
      } else {
        throw Exception('error occurred');
      }
    } catch(e) {
      print(e);
      rethrow;
    }
  }

  static Future add(String balance,String type,String password) async{
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/makeFinicialRequest'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "balance": balance,
          "type": type,
          "approvment_document": "452688912${Random().nextInt(9)}",
          "password": password
        }
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        print(response.body);
        return response.body;
      } else {
        throw Exception('error occurred');
      }
    } catch(e) {
      print(e);
      rethrow;
    }
  }
}