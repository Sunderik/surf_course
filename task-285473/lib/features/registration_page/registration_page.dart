import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_285473/features/registration_page/registration_page_view.dart';
import 'package:task_285473/features/registration_page/registration_page_widget_model.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<RegistrationPageWidgetModel>(
      create: (_) => RegistrationPageWidgetModel()..init(),
      dispose: (_, wm) => wm.dispose(),
      child: const RegistrationPageView(),
    );
  }
}
