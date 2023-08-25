import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';

class LocationApi {
  static Future pro() async {
    print('start api');
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getAllLoction'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        print('end api');
        return response.body;
      } else {
        print('error');
        throw Exception('error occurred');
      }
    } catch(error) {
      print(error);
      rethrow;
    }
  }
}