import 'package:flutter/material.dart';

ThemeData customeAppThemeLight() {
  //
  final base = ThemeData.light();

  return base.copyWith(
    textTheme: _customTextThemeLight(
      base.textTheme,
    ),
  );
}

TextTheme _customTextThemeLight(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5.copyWith(
      fontFamily: "",
      fontSize: 22.0,
      color: Colors.black,
    ),
  );
}
