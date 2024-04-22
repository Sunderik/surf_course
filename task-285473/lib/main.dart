import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_285473/core/core.dart';
import 'package:task_285473/features/registration_page/registration_page.dart';

/// Точка входа в приложение
void main() {
  runApp(const MainApp());
}

/// Базовый виджет приложения
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate], // для того чтобы пикер дат был на русском
      supportedLocales: const [Locale('ru')],
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).mainTheme,
      home: const RegistrationPage(),
    );
  }
}
