import 'package:flutter/material.dart';
import 'package:task_283813/core/wrappers/assets_wrapper.dart';

/// Виджет отображения аватара, помещенного в квадрат
class Avatar extends StatefulWidget {
  /// Минимально возможный размер стороны виджета
  final double minSideSize;

  /// Максимально возможный размер стороны виджета
  final double maxSideSize;

  /// Величина скругления углов виджета
  final double radius;

  const Avatar({super.key, this.minSideSize = 128, this.maxSideSize = 360, this.radius = 12});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(widget.radius);

    return Material(
      elevation: 6,
      borderRadius: radius,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Container(
          width: widget.maxSideSize,
          height: widget.maxSideSize,
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetsWrapper.avatar, fit: BoxFit.cover),
            borderRadius: radius,
          ),
        ),
      ),
    );
  }
}
