import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';


class PriceApi {
  static Future detail(int space, String coun,String city, String n,bool s,bool sup,bool lux,bool ind,bool heat ) async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getPropertyValue'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "space": '$space',
          "country":coun,
          "city":city,
          "neighborhood":n,
          "security":"$s",
          "supply":"$sup",
          "luxury":"$lux",
          "industry":"$ind",
          "heatControll":"$heat"
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
}