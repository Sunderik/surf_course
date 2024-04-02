import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280398/app_starter.dart';
import 'package:task_280398/core/di/injection.dart';
import 'package:task_280398/core/domain/models/app_theme.dart';

import 'core/domain/models/app_state_model.dart';
import 'features/profile_screen/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Ожидаем получения DI приложения
  await configureInjection();

  /// Подготовка к запуску приложения
  await AppStarter.startApp();

  /// Запуск приложения (настраиваем главный стейт приложения поверх всего дерева виджетов)
  runApp(
    ChangeNotifierProvider(
      create: (_) => injector.get<AppStateModel>(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  final appState = injector.get<AppStateModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Слушаем изменение системной темы устройства
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    // Меняем тему в приложение только если выбрана системная тема
    if (appState.currentTheme.number == 0) {
      appState.currentTheme = SystemTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (_, state, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: state.currentTheme.getThemeDataByTheme(context),
        home: const ProfileScreen(),
      );
    });
  }
}
