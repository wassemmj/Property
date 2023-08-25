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
          "location_id": '${propertyModel.locationId}',
          "category_id" : propertyModel.categoryId,
          "space" : '${propertyModel.space}',
          "description": propertyModel.description,
          "bath_count" :'${propertyModel.bathCount}',
          "room_count" :'${propertyModel.roomCount}',
          "floor_count" :'${propertyModel.floorCount}',
          "floor_number" :'${propertyModel.floorNumber}',
          "building_name": propertyModel.buildingName,
          "shared" :'${propertyModel.shared}',
          "owner":'${propertyModel.owner}',

          "air_condtioning":'${propertyModel.airConditioning}',
          "fireplace":'${propertyModel.fireplace}',
          "ventilation_system":'${propertyModel.ventilationSystem}',

          "isSecurity":'${propertyModel.isSecurity}',
          "guard":'${propertyModel.guard}',
          "cameras":'${propertyModel.cameras}',
          "fire_alert":'${propertyModel.fireAlert}',
          "earth_quake":'${propertyModel.earthQuake}',


          "isSupplies":'${propertyModel.isSupplies}',
          "solar_power":'${propertyModel.solarPower}',
          "internet_access":'${propertyModel.internetAccess}',
          "elevator":'${propertyModel.elevator}',
          "land_line":'${propertyModel.landLine}',
          "Main_street_access":'${propertyModel.mainStreetAccess}',
          "garage":'${propertyModel.garage}',

          "isLuxry":'${propertyModel.isLuxry}',
          "pool":'${propertyModel.pool}',
          "garden":'${propertyModel.garden}',
          "view_on_sea":'${propertyModel.viewOnSea}',

          "isindustry":'${propertyModel.isindustry}',
          "isolation":'${propertyModel.isolation}',
          "roden_control":'${propertyModel.rodenControl}',
          "capacity":'5500',
          "truck_accessible":'${propertyModel.truckAccessible}',

          "Rent":'${propertyModel.rent}',
          "receiving_date": propertyModel.receivingDate,
          "delivare_time": propertyModel.delivareTime,
          "price_per_day":'${propertyModel.pricePerDay}',

          "Purchase": '${propertyModel.purchase}',
          "price_per_meter":'${propertyModel.pricePerMeter}'
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