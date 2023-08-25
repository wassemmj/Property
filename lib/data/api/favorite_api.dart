import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';

class FavoriteApi {
  static Future addFav(int id) async{
    print('start api');
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/makeFavouriteAdvert'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          'advert_id' : '$id',
        }
      );
      print(response.statusCode);
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

  static Future delFav(int id) async{
    print('start api');
    try {
      var response = await http.post(
          Uri.parse('${Api.apiServer}/user/unfavouriteAdvert'),
          headers: {
            'Accept':'application/json',
            'Authorization': 'Bearer ${Token.token}',
          },
          body: {
            'advert_id' : '$id',
          }
      );
      print(response.body);
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

  static Future getFav() async{
    print('start api');
    try {
      var response = await http.post(
          Uri.parse('${Api.apiServer}/user/getYourFavouriteAdverts'),
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