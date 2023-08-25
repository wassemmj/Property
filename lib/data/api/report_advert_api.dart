import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';

class ReportAdvertApi {
  static Future report(int id,String m) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/reportAdvert'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "reportable_id": '$id',
          'details' : m,
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
      rethrow;
    }
  }

  static Future reportU(int id,String m) async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/reportUser'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "reportable_id": '$id',
          'details' : m,
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
    } catch(error) {
      rethrow;
    }
  }
}