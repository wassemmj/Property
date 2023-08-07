import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';

class ProfileApi {
  static Future pro(int id) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getUserProfile'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "user_id": '$id',
        },
      );
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
      print(error);
      rethrow;
    }
  }
}