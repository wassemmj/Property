import 'package:property_app/data/api/report_advert_api.dart';

class ReportAdvertRepo {
  static Future report(int id,String m) async {
    try {
      var response = await ReportAdvertApi.report(id, m);
      print(response);
      return response;
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future reportU(int id,String m) async {
    try {
      var response = await ReportAdvertApi.reportU(id, m);
      return response;
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}