import 'dart:convert';

import 'package:property_app/data/api/detail_api.dart';

class DetailRepo {
  static Future detail(int propertyId) async {
    try {
      var response = await DetailApi.detail(propertyId);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}