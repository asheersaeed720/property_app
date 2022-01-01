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
        // darkTheme: ThemeData.dark(),
        theme: ThemeData(
          // primaryColor: AppTheme.primary,
          primarySwatch: customPrimaryColor,
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

Map<int, Color> color = const {
  50: Color.fromRGBO(8, 45, 74, .1),
  100: Color.fromRGBO(8, 45, 74, .2),
  200: Color.fromRGBO(8, 45, 74, .3),
  300: Color.fromRGBO(8, 45, 74, .4),
  400: Color.fromRGBO(8, 45, 74, .5),
  500: Color.fromRGBO(8, 45, 74, .6),
  600: Color.fromRGBO(8, 45, 74, .7),
  700: Color.fromRGBO(8, 45, 74, .8),
  800: Color.fromRGBO(8, 45, 74, .9),
};

MaterialColor customPrimaryColor = MaterialColor(0xFF082d4a, color);
Color customAccentColor = const Color(0xFFF2EFF5);
