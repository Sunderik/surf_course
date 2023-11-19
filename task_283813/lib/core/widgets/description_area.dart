import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Виджет элемента описания
class DescriptionArea extends StatelessWidget {
  /// Заголовок виджета
  final String title;

  /// Контент виджета
  final String content;

  /// Иконка перед заголовком в формате svg
  final SvgPicture? icon;

  /// Стиль текста заголовка
  final TextStyle? titleTextStyle;

  /// Стиль текста контента
  final TextStyle? contentTextStyle;

  const DescriptionArea({
    super.key,
    required this.title,
    required this.content,
    this.icon,
    this.titleTextStyle,
    this.contentTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(width: 20, height: 20, child: icon),
                    ),
                  Flexible(
                    child: Text(
                      title,
                      style: titleTextStyle?.copyWith(fontSize: 24, fontWeight: FontWeight.w700) ??
                          Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      content,
                      style: contentTextStyle?.copyWith(fontSize: 18, fontWeight: FontWeight.w400) ??
                          Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
