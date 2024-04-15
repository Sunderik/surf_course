import 'package:flutter/material.dart';
import 'package:task_285473/core/core.dart';

/// Виджет кнопки отправки данных формы
class SendButton extends StatelessWidget {
  /// Параметр состояния загрузки данных
  final bool isLoading;

  /// Обработка нажатия кнопки
  final VoidCallback? callback;

  const SendButton({super.key, this.callback, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.mainButton.style,
              onPressed: isLoading ? null : callback,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isLoading ? const CircularProgressIndicator() : const Text(StringsConstants.sendButtonName),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
