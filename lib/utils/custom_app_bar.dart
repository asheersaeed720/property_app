import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/auth/views/login_screen.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/custom_dialog.dart';

AppBar customAppBar(context, appBarTxt, {color = Colors.white}) {
  return AppBar(
    title: Text(
      '$appBarTxt',
      style: const TextStyle(
        fontFamily: AppTheme.fontName,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
        color: AppTheme.nearBlack,
      ),
    ),
    elevation: 0,
    backgroundColor: color,
    iconTheme: const IconThemeData(color: Colors.black87),
    actions: [
      PopupMenuButton(
        elevation: 20,
        enabled: true,
        onSelected: (value) {
          if (value == '1') {
            // Get.toNamed(CandidateProfileScreen.routeName);
          } else if (value == '2') {
            showAlertDialog(
              context,
              'Logout',
              'Are you sure you want to logout!',
              () {
                // Get.find<AuthController>().signOutUser();
                Get.offNamed(LogInScreen.routeName);
              },
            );
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text(
              "My Profile",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
            ),
            value: "1",
          ),
          PopupMenuItem(
            child: Text(
              "Logout",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
            ),
            value: "2",
          ),
        ],
      ),
    ],
  );
}
