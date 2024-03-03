import 'package:flutter/material.dart';
import 'package:mobile/constants/app_color.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.light(
      primary: AppColor.primary,
    ),
  );
}
