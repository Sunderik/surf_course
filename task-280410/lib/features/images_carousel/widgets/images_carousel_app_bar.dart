import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280410/features/images_carousel/images_carousel_widget_model.dart';

/// Виджет заголовка окна каруcели изображений
class ImageCarouselAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Заголовок окна  каруcели изображений
  const ImageCarouselAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.colorScheme.background,
      centerTitle: true,
      iconTheme: theme.iconTheme.copyWith(color: Colors.black),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          size: 22,
          Icons.keyboard_backspace,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: const [CarouselPageCounter()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Виджет счетчика изображений в заголовке окна карусели изображений
class CarouselPageCounter extends StatelessWidget {
  const CarouselPageCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<ImageCarouselWidgetModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          StreamBuilder<int>(
              stream: wm.currentFrontImageController.stream,
              builder: (context, snapshot) {
                final currentIndex = wm.currentPageIndex + 1;
                return Text(
                  '$currentIndex',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                );
              }),
          Text(
            '/${wm.images.length}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
