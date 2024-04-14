import 'package:flutter/material.dart';
import 'package:task_285473/core/constants/strings_constants.dart';
import 'package:task_285473/core/theme/button_extensions.dart';

/// Виджет кнопки отправки данных формы
class SendButton extends StatelessWidget {
  final bool showLoader;

  /// Обработка нажатия кнопки
  final VoidCallback? callback;

  const SendButton({super.key, this.callback, this.showLoader = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.mainButton.style,
              onPressed: showLoader ? null : callback,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: showLoader ? const CircularProgressIndicator() : const Text(StringsConstants.sendButtonName),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
