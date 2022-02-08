import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/utils/constants.dart';

class ProjectService extends GetConnect {
  final _authController = Get.find<AuthController>();

  Future<Response> getAllProjects() async {
    return get(
      '$apiURL/Projects/all',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
    );
  }
}
