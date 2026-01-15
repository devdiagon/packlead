import 'package:flutter/material.dart';
import 'package:packlead/core/themes/index.dart';
import 'core/themes/test_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: getGeneralTheme(Brightness.light),
      darkTheme: getGeneralTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: const TestThemeScreen(),
    );
  }
}
