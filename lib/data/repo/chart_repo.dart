import 'dart:convert';

import 'package:property_app/data/api/chart_api.dart';

class ChartRepo {
  static Future sChart() async {
    try {
      var response = await ChartApi.sChart();
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future gChart() async {
    try {
      var response = await ChartApi.gChart();
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}