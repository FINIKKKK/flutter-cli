import 'package:flutter/material.dart';

/*
  Функция для показа предупреждающего окна ----------------
 */
void warning(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 3),
    ),
  );
}
