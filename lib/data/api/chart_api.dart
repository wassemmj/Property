import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';

class ChartApi {
  static Future sChart() async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/silverChart'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        return response.body;
      } else {
        throw Exception('error occurred');
      }
    } catch(error) {
      print(error);
      rethrow;
    }
  }


  static Future gChart() async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/goldChart'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
      // print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        return response.body;
      } else {
        throw Exception('error occurred');
      }
    } catch(error) {
      print(error);
      rethrow;
    }
  }
}