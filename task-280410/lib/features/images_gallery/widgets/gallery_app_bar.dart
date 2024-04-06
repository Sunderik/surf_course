import 'package:flutter/material.dart';
import 'package:task_280410/core/constants/string_constants.dart';

/// Виджет заголовка окна галереи изображений
class GalleryAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Заголовок окна галереи изображений
  const GalleryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        elevation: 0,
        title: SizedBox(width: 140, height: 34, child: Image.asset(StringConstants.logoAssetPath, fit: BoxFit.cover)));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
