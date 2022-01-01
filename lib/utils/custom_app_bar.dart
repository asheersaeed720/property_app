import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/auth/views/login_signup_screen.dart';
import 'package:property_app/src/profile/user_profile_screen.dart';
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
            Get.toNamed(UserProfileScreen.routeName);
          } else if (value == '2') {
            // Get.toNamed(ProfileScreen.routeName);
          } else if (value == '3') {
            showAlertDialog(
              context,
              'Logout',
              'Are you sure you want to logout!',
              () {
                Get.offAndToNamed(LogInSignUpScreen.routeName);
              },
            );
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Wrap(
              spacing: 10.0,
              children: const [
                Icon(Icons.person),
                Text("My Profile"),
              ],
            ),
            value: "1",
          ),
          PopupMenuItem(
            child: Wrap(
              spacing: 10.0,
              children: const [
                Icon(Icons.settings),
                Text("Settings"),
              ],
            ),
            value: "2",
          ),
          PopupMenuItem(
            child: Wrap(
              spacing: 10.0,
              children: const [
                Icon(Icons.exit_to_app),
                Text("Logout"),
              ],
            ),
            value: "3",
          ),
        ],
      ),
    ],
  );
}
