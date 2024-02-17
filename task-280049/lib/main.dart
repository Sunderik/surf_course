import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/keys/keys.dart';

import 'features/colors_screen/colors_screen.dart';

/// Точка входа в приложение
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Построение DI приложения
  configureInjection();

  /// Запуск приложения (настраиваем главный стейт приложения поверх всего дерева виджетов)
  runApp(
    ChangeNotifierProvider(
      create: (context) => injector.get<ColorsStateModel>(),
      child: const MainApp(),
    ),
  );
}

/// Базовый виджет приложения
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigatorKey.stateKey,
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      home: const ColorsScreen(),
    );
  }
}
