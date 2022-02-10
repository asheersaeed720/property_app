import 'dart:developer';

import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/utils/constants.dart';

class PropertyService extends GetConnect {
  final _authController = Get.find<AuthController>();

  Future<Response> getLocations() async {
    return get(
      '$apiURL/Locations/all',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
    );
  }

  Future<Response> getAllProperties(int propertiesListLength) async {
    log(propertiesListLength.toString());
    return get(
      '$apiURL/Properties/all',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
      query: {
        'per_page': '6',
        'offset': '$propertiesListLength',
      },
    );
  }

  Future<Response> getSearchableProperties(String userId) async {
    return get(
      '$apiURL/Properties/search',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
      query: {
        'assigned_user_id': userId,
      },
    );
  }
}
