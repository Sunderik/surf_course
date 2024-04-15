import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_285473/features/registration_page/registration_page_widget_model.dart';
import 'package:task_285473/features/registration_page/widgets/registration_form.dart';
import 'package:task_285473/features/registration_page/widgets/send_button.dart';

/// Виджет обертка страницы формы регистрации животного
class RegistrationPageView extends StatelessWidget {
  /// Обертка страницы формы регистрации животного
  const RegistrationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<RegistrationPageWidgetModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  child: RegistrationForm(),
                ),
              ),
              StreamBuilder<bool>(
                  stream: wm.loadingStatusStream,
                  builder: (_, __) {
                    return SendButton(callback: wm.sendData, isLoading: wm.isLoading);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
