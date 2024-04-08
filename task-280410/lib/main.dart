import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280410/core/domain/models/app_state_model.dart';
import 'package:task_280410/features/images_gallery/images_gallery.dart';

/// Точка входа в приложение
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Запуск приложения (настраиваем главный стейт приложения поверх всего дерева виджетов)
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppStateModel(),
      child: const MainApp(),
    ),
  );
}

///Основной виджет приложения
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImagesGallery(),
    );
  }
}
