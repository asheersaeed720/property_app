import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/src/auth/views/login_signup_screen.dart';
import 'package:property_app/src/home/home_screen.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        log('${authController.currentUserData}', name: 'AuthScreen');
        if (authController.currentUserData.isEmpty) {
          return const LogInSignUpScreen();
        }
        return const HomeScreen();
      },
    );
  }
}
