import 'package:flutter/material.dart';
import 'package:task_283812/widgets/animation_area.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'GestureMaster',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          body: const AnimationArea(),
        ),
      ),
    );
  }
}
