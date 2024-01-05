import 'package:flutter/material.dart';
import 'package:task_279830/core/domain/enums/pages_enum.dart';
import 'package:task_279830/core/theme/extensions/elevated_button_extension.dart';
import 'package:task_279830/core/theme/extensions/text_extension.dart';

/// Виджет экрана с личной информация пользователя
///
/// В рамках приложения в нем только кнопка для перехода в чек с товарами (чтобы соответствовать дизайну в Figma)
class PersonalInitScreen extends StatelessWidget {
  const PersonalInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(ScreensEnum.personal.name),
      ),
      body: Center(
        child: ElevatedButton(
          style: theme.elevatedButtonTheme.customElevatedButton,
          onPressed: () => Navigator.of(context).pushNamed("cheque"),
          child: Text(
            'Чек 56',
            style: theme.textTheme.customSubtitleBold.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
