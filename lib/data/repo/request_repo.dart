import 'package:property_app/data/api/request_api.dart';

class RequestRepo {
  static Future sendRequest(int id,String m) async {
    try {
      print(' start repo');
      var response = await RequestApi.sendRequest(id, m);
      return response;
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }
}