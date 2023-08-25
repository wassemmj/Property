import 'package:http/http.dart' as http;
import 'package:property_app/Core/api.dart';
import 'package:property_app/core/token.dart';


class AllPropertyApi {
  static Future allPropertyAuth() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getAllProperties'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}'
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

  static Future catProperty(String catName) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getCategoryProperty'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
        body: {
          "category_name": catName,
        }
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
      rethrow;
    }
  }
  
  static Future cat() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getAllCategories'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        return response.body;
      }
      else {
        print('error');
        throw Exception('error occurred');
      }
    } catch(error) {
      rethrow;
    }
  }

  static Future type(String name) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getCategoriestype'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}'
        },
        body: {
          "category_name": name,
        }
      );
      print(response.statusCode);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        return response.body;
      }
      else {
        throw Exception('error occurred');
      }
    } catch(error) {
      rethrow;
    }
  }
}