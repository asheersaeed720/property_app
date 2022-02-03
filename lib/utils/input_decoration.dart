import 'package:flutter/material.dart';

import 'app_theme.dart';

InputDecoration buildTextFieldInputDecoration(
  context, {
  required String hintTxt,
  IconData? preffixIcon,
}) {
  return InputDecoration(
    prefixIcon: Icon(
      preffixIcon,
      color: AppTheme.iconColor,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    contentPadding: const EdgeInsets.all(10),
    hintText: hintTxt,
    hintStyle: const TextStyle(fontSize: 14, color: AppTheme.textColor1),
  );
}

InputDecoration buildPasswordInputDecoration(
  context, {
  required String hintTxt,
  required IconData preffixIcon,
  required Widget suffixIcon,
}) {
  return InputDecoration(
    prefixIcon: Icon(
      preffixIcon,
      color: AppTheme.iconColor,
    ),
    suffixIcon: suffixIcon,
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.textColor1),
      borderRadius: BorderRadius.all(Radius.circular(35.0)),
    ),
    contentPadding: const EdgeInsets.all(10),
    hintText: hintTxt,
    hintStyle: const TextStyle(fontSize: 14, color: AppTheme.textColor1),
  );
}
