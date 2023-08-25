import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';

class FilterApi {
  static Future pro(String? country,String? city,String? ne,String? operation,String? name,String? type,String? space,String? mP,String? maP) async {
    print('start api');
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/search'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "country":country,
          "city":city,
          "neighborhood": ne ,
          "operation":operation ,
          "name":name ,
          "type":type ,
          "space": space,
          "minprice":mP ,
          "maxprice":maP

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
        if(response.body == 'no result') {
          return response.body;
        }
        throw Exception('error occurred');
      }
    } catch(error) {
      print(error);
      rethrow;
    }
  }
}