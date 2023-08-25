import 'package:http/http.dart' as http;
import 'package:property_app/Core/api.dart';

import '../../core/token.dart';

class SubscribeApi {
  static Future subscribe(int id,String password) async{
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/subscribe'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          'subscribtion_id' : '$id',
          'password' : password,
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

  static Future get() async{
    try {
      var response = await http.post(
          Uri.parse('${Api.apiServer}/getAllSubscribtions'),
          headers: {
            'Accept': 'application/json',
            // 'Authorization': 'Bearer ${Token.token}',
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
}