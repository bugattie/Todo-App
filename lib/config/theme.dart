import 'package:flutter/material.dart';
import 'package:todo/config/constants.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      errorBorder: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
    ),
  );
}
