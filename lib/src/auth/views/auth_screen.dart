import 'package:flutter/material.dart';
import 'package:property_app/src/onboarding_screen.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnBoardingScreen();
  }
}
