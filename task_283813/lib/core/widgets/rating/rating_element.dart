import 'package:flutter/material.dart';
import 'package:task_283813/core/core.dart';

/// Виджет для отображения элемента рейтинга
class RatingElement extends StatefulWidget {
  /// Признак, состояния элемента рейтинга, активен или нет.
  final bool isActive;

  /// Максимальный размер элемента
  final double maxElementSideSize;

  const RatingElement({super.key, this.isActive = false, this.maxElementSideSize = 50});

  @override
  State<RatingElement> createState() => _RatingElementState();
}

class _RatingElementState extends State<RatingElement> with TickerProviderStateMixin {
  late Animation<double> animation;
  late Tween<double> tween;
  late AnimationController animationController;

  @override
  void initState() {
    tween = Tween(begin: 0, end: 1);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sideSize = widget.maxElementSideSize;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: sideSize, maxWidth: sideSize),
      child: widget.isActive
          ? const Center(child: AssetsWrapper.fire)
          : Center(
              child: AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? child) {
                  return Transform.translate(
                    offset: Offset(0.0, 0.0 + animationController.value * 5.0),
                    child: child,
                  );
                },
                child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: sideSize * 0.3, maxWidth: sideSize * 0.3),
                    child: AssetsWrapper.coal),
              ),
            ),
    );
  }
}
