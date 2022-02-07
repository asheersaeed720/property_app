import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/utils/constants.dart';

class ComplaintService extends GetConnect {
  final _authController = Get.find<AuthController>();

  Future<Response> getComplaintCategory() async {
    return get(
      '$apiURL/Complaints/categories',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
    );
  }

  Future<Response> getUserComplaint() async {
    return get(
      '$apiURL/Complaints/all',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
    );
  }

  Future<Response> createComplaint(String title, String desc, String category) async {
    var complaintFormData = FormData({
      'category_id': '1',
      'title': title,
      'description': desc,
    });
    return post(
      '$apiURL/Complaints/create',
      complaintFormData,
      contentType: 'form-data',
      headers: {'x-api-key': '${_authController.currentUserData['key']}'},
    );
  }
}
