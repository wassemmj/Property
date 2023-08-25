import 'dart:convert';

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

  static Future getUserRequest() async {
    try {
      print(' start repo');
      var response = await RequestApi.getUserRequest();
      print(' end repo');
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future getPubRequest() async {
    try {
      print(' start repo');
      var response = await RequestApi.getPubRequest();
      print(' end repo');
      if(response == 'you have no requests') {
      return response;
      }
      return jsonDecode(response);
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future accept(int rId,int aId) async {
    try {
      print(' start repo');
      var response = await RequestApi.accept(rId, aId);
      print(' end repo');
      return response;
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future reject(int rId,int aId,String d) async {
    try {
      print(' start repo');
      var response = await RequestApi.reject(rId, aId, d);
      print(' end repo');
      return response;
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future deleteRequest(int id) async {
    try {
      print(' start repo');
      var response = await RequestApi.deleteRequest(id);
      print(' end repo');
      return response;
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }

  static Future delete(int id) async {
    try {
      print(' start repo');
      var response = await RequestApi.delete(id);
      print(' end repo');
      return response;
    } catch(error) {
      print(error);
      throw Exception('error in repo');
    }
  }
}