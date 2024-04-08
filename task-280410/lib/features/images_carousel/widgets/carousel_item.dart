import 'package:flutter/material.dart';
import 'package:task_280410/core/domain/models/image_model.dart';
import 'package:task_280410/core/library/hero_image.dart';

/// Виджет изображения из карусели
class CarouselItem extends StatelessWidget {
  /// Объект изображения
  final ImageModel image;

  /// Признак того что это изображение на переднем плане
  final bool isFrontImage;

  ///Элемент карусели изображений
  const CarouselItem({required this.image, this.isFrontImage = false, super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: HeroImage(image: image, isBlur: !isFrontImage),
      ),
    );
  }
}
