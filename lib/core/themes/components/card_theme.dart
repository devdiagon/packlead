import 'package:flutter/material.dart';

CardThemeData getCardTheme() {
  return CardThemeData(
    color: Colors.white,
    elevation: 1.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  );
}
