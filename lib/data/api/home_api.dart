import 'package:http/http.dart' as http;

import '../../Core/api.dart';

class HomeApi {
  static Future getTop() async {
    print('start api');
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/getTopAccount'),
        headers: {
          'Accept':'application/json',
          // 'Authorization': 'Bearer ${Token.token}',
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

  static Future search(String query) async {
    print('start api');
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/searchByName'),
        headers: {
          'Accept':'application/json',
          // 'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          'name' : query,
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

  static Future getRandom() async {
    print('start api');
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/getRandomProperties'),
        headers: {
          'Accept':'application/json',
          // 'Authorization': 'Bearer ${Token.token}',
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