import 'dart:io';

import 'package:http/http.dart' as http;

import '../../Core/api.dart';
import '../../core/token.dart';

class ProfileApi {
  static Future pro(int id) async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getUserProfile'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "user_id": '$id',
        },
      );
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

  static Future followers() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getFollowerAccount'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
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

  static Future follow(int userId) async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/makeFavourit'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "user_id": '${userId}',
        },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        print(response.body);
        return response.body;
      } else if(response.statusCode == 403) {
        print(response.body);
        return response.body;
      }
      else {
        throw Exception('error occurred');
      }
    } catch(error) {
      print(error);
      rethrow;
    }
  }

  static Future unfollow(int userId) async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/unfollow'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "user_id": '${userId}',
        },
      );
      print(response.body);
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        print(response.body);
        return response.body;
      }
      else {
        throw Exception('error occurred');
      }
    } catch(error) {
      print(error);
      rethrow;
    }
  }

  static Future getImage() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getUserImageURL3'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
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

  static Future createImage(File f , bool update) async {
    try {
      if(update) {
        print('send file');
        var headers = {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        };
        var request = http.MultipartRequest('POST', Uri.parse('${Api.apiServer}/user/updateUserImage'));
        request.files.add(await http.MultipartFile.fromPath('url', f.path));
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        print(response.statusCode);
        if(response.statusCode == 200) {
          return response.stream.bytesToString();
        } else {
          throw Exception('error occured');
        }
      } else  {
        print('send file');
        var headers = {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        };
        var request = http.MultipartRequest('POST', Uri.parse('${Api.apiServer}/user/createUserImage'));
        request.files.add(await http.MultipartFile.fromPath('url', f.path));
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        print(response.statusCode);
        if(response.statusCode == 200) {
          return response.stream.bytesToString();
        } else {
          throw Exception('error occured');
        }
      }
    } catch(error) {
      print(error);
      rethrow;
    }
  }

  static Future put(String name,String password,String co,String num,String f,String t,String d) async {
    try {
      var response = await http.put(
        Uri.parse('${Api.apiServer}/user/updateUserProfile'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
            "name": name ,
            "password":password,
            "password_confirmation":co,
            "phone_number":num,
            "facebook_url":f,
            "twitter_url":t,
            "description": d
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

  static Future getFavAccount() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getFavouritAccount'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
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

  static Future getFolAccount() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getFollowerAccount'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
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

  static Future getUserEss() async {
    try {
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/getUserEssentialInfo'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
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

  static Future deleteUser() async {
    try {
      var response = await http.delete(
        Uri.parse('${Api.apiServer}/user/deleteMyAccount'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
      );
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