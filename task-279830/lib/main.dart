import 'package:flutter/material.dart';
import 'package:task_279830/core/theme/base_them.dart';
import 'package:task_279830/features/app/app.dart';

/// Точка входа в приложение
void main() {
  runApp(const MainApp());
}

///   обертка приложения верхнего уровня с настройкой темы
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: baseTheme(context),
      home: const App(),
    );
  }
}
