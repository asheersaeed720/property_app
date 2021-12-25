import 'package:get/get.dart';
import 'package:property_app/src/auth/views/auth_screen.dart';
import 'package:property_app/src/auth/views/forgot_password_screen.dart';
import 'package:property_app/src/auth/views/login_screen.dart';
import 'package:property_app/src/auth/views/sign_up_screen.dart';
import 'package:property_app/src/home/home_screen.dart';
import 'package:property_app/src/property/property_detail_screen.dart';
import 'package:property_app/src/property/property_filter_screen.dart';
import 'package:property_app/src/property/property_screen.dart';

final List<GetPage<dynamic>> customRoutes = [
  GetPage(
    name: AuthScreen.routeName,
    page: () => const AuthScreen(),
  ),
  GetPage(
    name: LogInScreen.routeName,
    page: () => const LogInScreen(),
  ),
  GetPage(
    name: SignUpScreen.routeName,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: ForgotPasswordScreen.routeName,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: PropertyScreen.routeName,
    page: () => const PropertyScreen(),
  ),
  GetPage(
    name: PropertyFilterScreen.routeName,
    page: () => const PropertyFilterScreen(),
  ),
  GetPage(
    name: PropertyDetailScreen.routeName,
    page: () => const PropertyDetailScreen(),
  ),
];
