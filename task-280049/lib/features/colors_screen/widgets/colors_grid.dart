import 'package:flutter/material.dart';
import 'package:task_280049/core/logic/objects/entities/color_entity.dart';
import 'package:task_280049/features/colors_screen/widgets/color_tile.dart';

class ColorsGrid extends StatelessWidget {
  final List<ColorEntity> colors;

  const ColorsGrid({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 30,
        children: [...colors.map((e) => ColorTile(color: e))],
      ),
    );
  }
}
