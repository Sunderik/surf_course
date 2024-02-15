import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/core/core.dart';
import 'package:task_280049/features/colors_screen/colors_screen_view.dart';
import 'package:task_280049/features/colors_screen/colors_screen_widget_model.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorsStateModel>(builder: (context, colorState, child) {
      return ProxyProvider0<ColorsScreenWidgetModel>(
        update: (_, __) => ColorsScreenWidgetModel(state: colorState)..init(),
        dispose: (ctx, wm) => wm.dispose(),
        child: const ColorsScreenView(),
      );
    });
  }
}
