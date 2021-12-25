import 'package:flutter/material.dart';

InputDecoration buildTextFieldInputDecoration(
  context, {
  required String hintTxt,
  Widget? preffixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide.none,
    ),
    hintText: hintTxt,
    isDense: true,
    // ignore: unnecessary_null_in_if_null_operators
    prefixIcon: preffixIcon ?? null,
    // ignore: unnecessary_null_in_if_null_operators
    suffixIcon: suffixIcon ?? null,
  );
}

InputDecoration buildPasswordInputDecoration(
  context, {
  required String hintTxt,
  required Widget suffixIcon,
}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide.none,
    ),
    hintText: hintTxt,
    isDense: true,
    prefixIcon: const Icon(Icons.lock),
    suffixIcon: suffixIcon,
  );
}
