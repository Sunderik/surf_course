import 'package:flutter/material.dart';
import 'package:task_283812/widgets/animаted_object.dart';

/// Виджет интерактивного контейнера в который помещен объект анимации
class AnimatedObjectInteractiveContainer extends StatefulWidget {
  /// Высота контейнера
  final double height;

  /// Ширина контейнера
  final double width;

  /// Цвет передаваем вы объект анимации
  final Color color;

  const AnimatedObjectInteractiveContainer({required this.height, required this.width, required this.color, super.key});

  @override
  State<AnimatedObjectInteractiveContainer> createState() => _AnimatedObjectInteractiveContainerState();
}

/// Состояние виджета интерактивного контейнера
class _AnimatedObjectInteractiveContainerState extends State<AnimatedObjectInteractiveContainer> {
  /// Флаг того что на анимируемый объект наведена мышка
  late bool isHovered;

  @override
  void initState() {
    super.initState();
    // По умолчанию на объекте нет мышки
    isHovered = false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        // Когда мышка входит в границы объекта
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        // Когда мышка выходит из границ объекта
        setState(() {
          isHovered = false;
        });
      },
      child: Material(
        elevation: isHovered ? 6.0 : 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.width)),
        child: AnimatedContainer(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          width: widget.width,
          height: widget.height,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: AnimatedObject(
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
