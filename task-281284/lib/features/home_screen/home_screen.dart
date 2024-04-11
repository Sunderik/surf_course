import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_281284/features/home_screen/home_screen_view.dart';
import 'package:task_281284/features/home_screen/home_screen_widget_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<HomeScreenWidgetModel>(
      create: (_) => HomeScreenWidgetModel()..init(),
      dispose: (_, wm) => wm.dispose(),
      child: const HomeScreenView(),
    );
  }
}
