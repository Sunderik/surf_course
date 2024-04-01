import 'package:flutter/material.dart';
import 'package:task_280398/core/theme/text_extension.dart';

/// Виджет контейнера с информацией о пользователе
class ProfileInfoContainer extends StatelessWidget {
  /// Заголовок контейнера
  final String title;

  /// Информация контейнера
  final String data;

  /// Функция обработки нажатия на контейнер
  ///
  /// По наличию функции показывается стрелка в правой части контейнера
  final VoidCallback? callback;

  const ProfileInfoContainer({super.key, required this.title, required this.data, this.callback});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: callback,
        behavior: HitTestBehavior.opaque,
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: scheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: textTheme.customNormal.copyWith(color: scheme.secondary)),
                      Text(data, style: textTheme.customNormal.copyWith(color: scheme.tertiary)),
                    ],
                  ),
                ),
                if (callback != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: Icon(
                          Icons.chevron_right_rounded,
                          size: 24,
                          color: scheme.primary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
