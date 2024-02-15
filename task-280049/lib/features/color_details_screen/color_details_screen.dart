import 'package:flutter/material.dart';

class ColorDetailsScreen extends StatelessWidget {
  const ColorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Details"),
        ),
      ),
    );
  }
}
