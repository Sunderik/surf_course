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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final sideSize =
            constraints.maxWidth <= constraints.maxHeight ? constraints.maxWidth : constraints.maxHeight * 0.7;
        return Material(
          elevation: 6,
          borderRadius: radius,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: widget.minSideSize,
              maxWidth: widget.maxSideSize,
              minHeight: widget.minSideSize,
              maxHeight: widget.maxSideSize,
            ),
            child: SizedBox(
              width: sideSize,
              height: sideSize,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetsWrapper.avatar, fit: BoxFit.cover),
                  borderRadius: radius,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
