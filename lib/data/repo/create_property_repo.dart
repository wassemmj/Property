import 'dart:convert';

import 'package:property_app/data/Model/property_model.dart';
import 'package:property_app/data/api/create_property_api.dart';

class CreatePropertyRepo {
  static Future create(PropertyModel propertyModel) async {
    try {
      print('start repo');
      var response = await CreatePropertyApi.create(propertyModel);
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }
}