import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280398/features/profile_screen/profile_screen_view.dart';
import 'package:task_280398/features/profile_screen/profile_screen_widget_model.dart';

/// Виджет обертка окна профиля пользователя
class ProfileScreen extends StatelessWidget {
  /// Обертка окна профиля пользователя
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ProfileScreenWidgetModel>(
      create: (_) => ProfileScreenWidgetModel()..init(),
      dispose: (_, wm) => wm.dispose(),
      child: const ProfileScreenView(),
    );
  }
}
