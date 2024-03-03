import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String text, {
  Color color = Colors.blue,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: color,
    ),
  );
}