import 'package:flutter/material.dart';
import 'package:demo_app_rr/home.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: FlexThemeData.light(
      scheme: FlexScheme.gold,
      useMaterial3: true,
    ),
    darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.gold,
        useMaterial3: true,
    ),
  ));
}

