import 'dart:convert';
import 'dart:io';

import 'package:property_app/data/api/property_image_api.dart';

class PropertyImageRepo {
  static Future createImage(int id,String desc,File f,bool cover) async {
    try {
      print('start repo');
      var response = await PropertyImageApi.g(id, desc, f, cover);
      print(response);
      print('end repo');
      return response;
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future getImage(int id) async {
    try {
      print('start repo');
      var response = await PropertyImageApi.getImage(id);
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}