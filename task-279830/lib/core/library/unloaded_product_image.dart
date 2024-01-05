import 'package:flutter/material.dart';

/// Виджет изображения, которое показывается когда не удалось загрузить изображение продукта
class UnloadedProductImage extends StatelessWidget {
  const UnloadedProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 24,
            maxHeight: 24,
          ),
          child: const Opacity(
            opacity: 0.5,
            child: Icon(Icons.restaurant),
          ),
        ),
      ),
    );
  }
}
