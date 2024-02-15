import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280049/features/color_details_screen/color_details_screen_widget_model.dart';

class ColorDetailsScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ColorDetailsScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ColorDetailsScreenWidgetModel>(context, listen: false);
    final color = widgetModel.color.getColor();

    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
        onPressed: () => widgetModel.backNavigation(context),
      ),
      backgroundColor: color,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
