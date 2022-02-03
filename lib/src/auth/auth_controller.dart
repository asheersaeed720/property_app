import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_app/src/auth/auth_service.dart';
import 'package:property_app/src/auth/user.dart';
import 'package:property_app/src/auth/views/auth_screen.dart';
import 'package:property_app/src/network_manager.dart';
import 'package:property_app/utils/custom_snack_bar.dart';
import 'package:property_app/utils/display_toast_message.dart';

class AuthController extends NetworkManager {
  final _authService = Get.find<AuthService>();

  final UserModel userFormModel = UserModel();

  final GetStorage _getStorage = GetStorage();

  Map currentUserData = {};

  bool _obscureText = true;
  bool get obscureText => _obscureText;
  set obscureText(bool newObscureVal) {
    _obscureText = newObscureVal;
    update();
  }

  @override
  void onInit() {
    currentUserData = getCurrentUser();
    super.onInit();
  }

  Future<void> handleLogIn() async {
    if (connectionType != 0) {
      try {
        var response = await _authService.logInUser(userFormModel);
        if (response.statusCode == 200) {
          currentUserData = getCurrentUser();
          update();
          Get.offNamed(AuthScreen.routeName);
        } else if (response.statusCode == 404) {
          displayToastMessage('Invalid Credentials');
        } else {
          displayToastMessage('Something went wrong');
        }
        log('loginRes ${response.body}, type:${response.body.runtimeType}');
      } catch (e) {
        displayToastMessage(e);
        rethrow;
      }
    } else {
      customSnackBar('Network error', 'Please try again later');
    }
  }

  Map getCurrentUser() {
    Map userData = _getStorage.read('user') ?? {};
    if (userData.isNotEmpty) {
      Map user = userData;
      log('$userData', name: 'storeUser');
      return user;
    }
    return {};
  }
}
