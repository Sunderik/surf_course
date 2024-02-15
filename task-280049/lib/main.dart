import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/core/logic/keys/keys.dart';

import 'features/colors_screen/colors_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Построение DI
  configureInjection();

  runApp(
    ChangeNotifierProvider(
      create: (context) => injector.get<ColorsStateModel>(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigatorKey.stateKey,
      scaffoldMessengerKey: AppNavigatorKey.messengerKey,
      debugShowCheckedModeBanner: false,
      theme: baseTheme(context),
      home: const ColorsScreen(),
    );
  }
}
