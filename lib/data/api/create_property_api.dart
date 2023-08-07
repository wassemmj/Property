import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:property_app/Core/api.dart';
import 'package:property_app/data/Model/property_model.dart';

import '../../core/token.dart';

class CreatePropertyApi {
  static Future create(PropertyModel propertyModel) async {
    try {
      print('start api');
      var response = await http.post(
        Uri.parse('${Api.apiServer}/user/createProperty'),
        headers: {
          'Accept':'application/json',
          'Authorization': 'Bearer ${Token.token}',
        },
        body: {
          "location_id":'1 ' ,
          "category_id" :'1',
          "space" :'500',
          "description": "hekc;lsdjpohdsifhikdsfdgdfghsandjfhsduiofhoiuhsd",
          "bath_count" :'2',
          "room_count" :'2',
          "floor_count" :'2',
          "floor_number" :'2',
          "building_name": "nfiufgoiusgf",
          "shared" :'true',

          "isHeatControl":'false',
          "air_condtioning":'true',
          "fireplace":'false',
          "ventilation_system":'false',

          "isSecurity":'true',
          "guard":'true',
          "cameras":'false',
          "fire_alert":'false',
          "earth_quake":'true',


          "isSupplies":'false',
          "solar_power":'true',
          "internet_access":'false',
          "elevator":'false',
          "land_line":'true',
          "Main_street_access":'true',
          "garage":'false',

          "isLuxry":'false',
          "pool":'true',
          "garden":'false',
          "view_on_sea":'false',

          "isindustry":'true',
          "isolation":'true',
          "roden_control":'false',
          "capacity":'5500',
          "truck_accessible":'false',

          "Rent":'false',
          "receiving_date":"2023-08-29",
          "delivare_time":"2023-09-27",
          "price_per_day":'5500',

          "Purchase": true,
          "total_price":'550000',
          "price_per_meter":'5500'
        },
      );
      print('${response.statusCode}   ${response.body}');
      if(response.statusCode == 200) {
        if(response.body.isEmpty) {
          throw Exception('empty');
        }
        print('end api');
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