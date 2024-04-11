import 'package:flutter/material.dart';
import 'package:task_281284/core/library/fade_pade_route.dart';
import 'package:task_281284/core/library/hero_item.dart';

import '../../features/prediction_screen/prediction_scree.dart';

class FlyingWidget extends StatefulWidget {
  final Widget child;

  const FlyingWidget({super.key, required this.child});

  @override
  State<FlyingWidget> createState() => _FlyingWidgetState();
}

class _FlyingWidgetState extends State<FlyingWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(begin: Offset.zero, end: const Offset(0, 0.15)).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
          onTap: () => Navigator.of(context).push(FadePageRoute(const PredictionScreen())),
          child: HeroItem(child: widget.child)),
    );
  }
}
