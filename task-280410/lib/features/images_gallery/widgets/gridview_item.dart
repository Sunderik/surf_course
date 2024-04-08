import 'package:flutter/material.dart';
import 'package:task_280410/core/domain/models/image_model.dart';
import 'package:task_280410/core/library/hero_image.dart';

/// Виджет элемента сетки изображений окна галереи изображений
class GridViewItem extends StatelessWidget {
  /// Объект изображения находящегося в данном элементе сетки
  final ImageModel image;

  /// Функция обработки нажатия по элементу сетки изображений
  final VoidCallback? onTap;

  /// Сетка изображений
  const GridViewItem({super.key, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: HeroImage(image: image, fit: BoxFit.cover),
      ),
    );
  }
}
