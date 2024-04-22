import 'package:flutter/material.dart';
import 'package:task_281284/core/di/injectable.dart';
import 'package:task_281284/features/home_screen/home_screen.dart';

/// Точка входа в приложение
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Ожидаем получения DI приложения
  await configureDependencyInjections();

  runApp(const MainApp());
}

/// Базовый виджет приложения
class MainApp extends StatelessWidget {
  /// Приложение
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
