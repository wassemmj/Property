import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:property_app/core/id.dart';

import '../../Core/api.dart';
import '../../core/token.dart';

class RequestApi {
  static Future sendRequest(int id,String m) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/createRequest'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "advert_id": '$id',
          'details' : m,
        },
      );
      print(response.body);
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
      print(error);
      rethrow;
    }
  }

  static Future getUserRequest() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getUserRequests'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        print(jsonDecode(response.body));
        return response.body;
      } else {
        throw Exception('error occurred');
      }
    } catch(error) {
      rethrow;
    }
  }

  static Future getPubRequest() async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getpublisherRequests'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
      print(response.statusCode);
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

  static Future accept(int rId,int aId) async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/AcceptRequest'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body:  {
          "request_id": '$rId',
          "advert_id": '$aId',
        },
      );
      print(response.body);
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

  static Future reject(int rId,int aId,String d) async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/rejectRequest'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body:  {
          "advert_id": '$aId',
          "request_id": '$rId',
          "description": d
        },
      );
      print(response.statusCode);
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

  static Future deleteRequest(int id) async {
    try {
      print('start api');
      var response = await http.delete(
        Uri.parse('${Api.apiServer}/user/deleteRequest'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body:  {
          "request_id" : '$id'
        },
      );
      print(response.statusCode);
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

  static Future delete(int id) async {
    try {
      print('start api');
      var response = await http.delete(
        Uri.parse('${Api.apiServer}/user/deleteProperty'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body:  {
          'advert_id' : '$id',
          'user_id' : '${Id.id}',
        },
      );
      print(response.body);
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
}