import 'package:flutter/material.dart';

import './size_config.dart';

const kBackground = Color(0xFFF3F3F3);
const kPrimaryColor = Color(0xFFFB475F);
const kSecondaryColor = Color(0xFFF5E1CB);
const kGreenLight = Color(0xFFC1FDD7);
const kGreenDark = Color(0xFF28C76F);
const kLightBlue = Color(0xFFE0F9FD);
const kLightBlueDark = Color(0xFF00CFE8);

const kLightPurple = Color(0xFFEEECFE);
const kLightPurpleDark = Color(0xFF9990F4);

const kLightOrange = Color(0xFFFFF3E8);
const kLightOrangeDark = Color(0xFFFF9F43);

const kTextColor = Color(0xFF35364F);
const kBorderColor = Color(0xFFDDDDDD);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: kTextColor.withOpacity(.7),
  ),
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter Valid Email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please enter your name";
