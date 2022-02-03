import 'dart:developer';

import 'package:get/get.dart';
import 'package:property_app/src/auth/user.dart';
import 'package:property_app/utils/constants.dart';

class AuthService extends GetConnect {
  Future<Response> logInUser(UserModel user) async {
    var loginFormData = FormData({
      'username': user.username,
      'password': user.password,
    });
    log(user.username);
    log(user.password);
    return post('$baseURL/Auth/login', loginFormData, contentType: 'form-data');
  }
}
