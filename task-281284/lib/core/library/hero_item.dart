import 'package:flutter/material.dart';

class HeroItem extends StatelessWidget {
  final Widget child;

  const HeroItem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: 'hero-tag', child: child);
  }
}
