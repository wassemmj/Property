import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import 'dart:io';
import '../../core/token.dart';

class PropertyImageApi {
  static Future createImage(int id,String desc,File f,bool cover) async {
    try {
      print('send file');
      var headers = {
        'Accept':'application/json',
        'Authorization': 'Bearer ${Token.token}',
      };
      var request = http.MultipartRequest('POST', Uri.parse('${Api.apiServer}/user/createUserImage'));
      request.files.add(await http.MultipartFile.fromPath('url', f.path));
      request.headers.addAll(headers);
      request.fields.addAll({
        'cover': '$cover',
        'property_id': '$id',
        'description': desc
      });
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if(response.statusCode == 200) {
        return response.stream.bytesToString();
      } else {
        throw Exception('error occured');
      }
    } catch(error) {
      print(error);
      rethrow;
    }
  }

  static Future g(int id,String desc,File f,bool cover) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token.token}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${Api.apiServer}/user/createPropertyImage'));
    request.fields.addAll({
      'cover': '$cover',
      'property_id': '${id}',
      'description': desc
    });
    request.files.add(await http.MultipartFile.fromPath('url', f.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
      return response.stream.bytesToString();
    }
    else {
    print(response.reasonPhrase);
    }
  }

  static Future getImage(int id) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/getPropertyImages'),
        headers: {
          'Accept':'application/json',
          // 'Authorization': 'Bearer ${Token.token}',
        },
        body:  {
          "property_id" : '$id'
        }
      );
      print(response.body);
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