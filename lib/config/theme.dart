import 'package:flutter/material.dart';
import 'package:todo/config/constants.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: kBackground,
    textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backwardsCompatibility: false,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      errorBorder: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
    ),
  );
}
