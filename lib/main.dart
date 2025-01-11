import 'package:flutter/material.dart';
import 'package:demo_app_rr/home.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: FlexThemeData.light(
      scheme: FlexScheme.shark,
      useMaterial3: true,
    ),
    darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.shark,
        useMaterial3: true,
    ),
  ));
}

