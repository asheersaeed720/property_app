import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/utils/constants.dart';

class PropertyService extends GetConnect {
  final _authController = Get.find<AuthController>();

  Future<Response> getAllProperties() async {
    return get(
      '$apiURL/Properties/all',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
    );
  }
}
