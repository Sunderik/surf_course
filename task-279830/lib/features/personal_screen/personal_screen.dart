import 'package:flutter/material.dart';
import 'package:task_279830/features/personal_screen/cheque_screen/cheque_screen.dart';
import 'package:task_279830/features/personal_screen/personal_init_screen.dart';

/// Виджет обертка пользовательского экрана с личной информацией
class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'personal',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'personal':
            return MaterialPageRoute(builder: (context) => const PersonalInitScreen(), settings: settings);
          case 'cheque':
            return MaterialPageRoute(builder: (context) => const ChequeScreen(), settings: settings);
          default:
            throw Exception("Invalid route");
        }
      },
    );
  }
}
