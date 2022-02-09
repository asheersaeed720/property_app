import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/utils/constants.dart';

class PropertyService extends GetConnect {
  final _authController = Get.find<AuthController>();

  Future<Response> getAllProperties(int propertiesListLength) async {
    return get(
      '$apiURL/Properties/all',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
      query: {
        'per_page': '6',
        'offset': '${propertiesListLength + 6}',
      },
    );
  }

  // Future<Response> getSearchableProperties() async {
  //   FormData data = FormData({
  //     'login': user.email,
  //     'password': user.password,
  //   });
  //   return post('$apiURL/Properties/search', data, contentType: 'form-data');
  // }
}
