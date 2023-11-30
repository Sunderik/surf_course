import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/base_them.dart';
import 'package:task_279830/features/app/app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: baseTheme(context),
      home: const App(),
    );
  }
}
