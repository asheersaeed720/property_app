import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/utils/constants.dart';

class EventService extends GetConnect {
  final _authController = Get.find<AuthController>();

  Future<Response> getAllEvents() async {
    return get(
      '$apiURL/Events/all',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
    );
  }
}
