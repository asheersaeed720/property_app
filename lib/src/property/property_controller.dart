import 'dart:io';

import 'package:get/get.dart';
import 'package:property_app/src/property/property_model.dart';
import 'package:property_app/src/property/property_service.dart';

class PropertyController extends GetxController {
  final _propertyService = Get.put(PropertyService());

  Future<List<PropertyModel>> getAllProperties() async {
    try {
      var response = await _propertyService.getAllProperties();
      if (response.statusCode == 200) {
        var responseJson = response.body;
        return (responseJson as List).map((i) => PropertyModel.fromJson(i)).toList();
      } else {
        throw ('Failed to load Properties');
      }
    } on SocketException {
      throw ('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }
}
