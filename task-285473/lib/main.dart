import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_285473/core/theme/theme_extensions.dart';
import 'package:task_285473/features/registration_page/registration_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('ru')],
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).mainTheme,
      home: const RegistrationPage(),
    );
  }
}
