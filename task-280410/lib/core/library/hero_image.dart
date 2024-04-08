import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_280410/core/domain/models/image_model.dart';

/// Виджет изображение с привязкой к Hero анимации
class HeroImage extends StatelessWidget {
  /// Объект изображения
  final ImageModel image;

  /// Признак того, что приложение должно быть замелено
  final bool isBlur;

  /// Способ растягивания изображения на области
  final BoxFit fit;

  const HeroImage({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.isBlur = false,
  });

  @override
  Widget build(BuildContext context) {
    final double blurStrength = isBlur ? 10 : 0;
    return Hero(
      tag: image.heroTag,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(image.urlPath),
            fit: fit,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
    );
  }
}
