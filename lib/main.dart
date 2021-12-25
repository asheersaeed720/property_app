import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_app/src/auth/views/auth_screen.dart';
import 'package:property_app/src/main_binding.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/custom_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Property App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppTheme.primary,
          errorColor: Colors.red[800],
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: AppTheme.fontName,
          textTheme: AppTheme.textTheme,
        ),
        initialBinding: MainBinding(),
        initialRoute: AuthScreen.routeName,
        getPages: customRoutes,
      );
}

// Map<int, Color> color = {
//   50: const Color.fromRGBO(30, 61, 88, .1),
//   100: const Color.fromRGBO(30, 61, 88, .2),
//   200: const Color.fromRGBO(30, 61, 88, .3),
//   300: const Color.fromRGBO(30, 61, 88, .4),
//   400: const Color.fromRGBO(30, 61, 88, .5),
//   500: const Color.fromRGBO(30, 61, 88, .6),
//   600: const Color.fromRGBO(30, 61, 88, .7),
//   700: const Color.fromRGBO(30, 61, 88, .8),
//   800: const Color.fromRGBO(30, 61, 88, .9),
// };

// MaterialColor customPrimaryColor = MaterialColor(0xFF1e3d58, color);
