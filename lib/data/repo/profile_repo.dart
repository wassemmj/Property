import 'dart:convert';
import 'dart:io';

import 'package:property_app/data/api/profile_api.dart';

class ProfileRepo {
  static Future pro(int id) async {
    try {
      var response = await ProfileApi.pro(id);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future followers() async {
    try {
      var response = await ProfileApi.followers();
      print(response);
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future follow(int userId) async {
    try {
      print('start repo');
      var response = await ProfileApi.follow(userId);
      print('end repo');
      return response;
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future unfollow(int userId) async {
    try {
      print('start repo');
      var response = await ProfileApi.unfollow(userId);
      print('end repo');
      return response;
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future getImage() async {
    try {
      print('start repo');
      var response = await ProfileApi.getImage();
      print('end repo');
      return response;
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future put(String name,String password,String co,String num,String f,String t,String d) async {
    try {
      print('start repo');
      var response = await ProfileApi.put(name, password, co, num, f, t, d);
      print('end repo');
      return response;
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future createImage(File f,bool update) async {
    try {
      print('start repo');
      var response = await ProfileApi.createImage(f,update);
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future getFavAccount() async {
    try {
      print('start repo');
      var response = await ProfileApi.getFavAccount();
      print('end repo');
      if(response == 'you haven\'t folowed any user') {
        return [];
      }
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future getFolAccount() async {
    try {
      print('start repo');
      var response = await ProfileApi.getFolAccount();
      print('end repo');
      if( response == 'you haven\'t been folowed by any user') {
        return [];
      }
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future getUserEss() async {
    try {
      print('start repo');
      var response = await ProfileApi.getUserEss();
      print('end repo');
      return jsonDecode(response);
    } catch(error) {
      throw Exception('error in repo');
    }
  }

  static Future delete() async {
    try {
      print('start repo');
      var response = await ProfileApi.deleteUser();
      print('end repo');
      return response;
    } catch(error) {
      throw Exception('error in repo');
    }
  }
}