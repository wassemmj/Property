import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';

class RequestApi {
  static Future sendRequest(int id,String m) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/createRequest'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "advert_id": '$id',
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
      print(error);
      rethrow;
    }
  }
}