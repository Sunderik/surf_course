import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280410/features/images_carousel/images_carousel_widget_model.dart';
import 'package:task_280410/features/images_carousel/widgets/carousel_item.dart';
import 'package:task_280410/features/images_carousel/widgets/images_carousel_app_bar.dart';

/// Виджет окна карусели изображений
class ImageCarouselScreen extends StatelessWidget {
  /// Окно карусели изображений
  const ImageCarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<ImageCarouselWidgetModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const ImageCarouselAppBar(),
        body: PageView.builder(
          controller: wm.pageController,
          itemCount: wm.images.length,
          itemBuilder: (context, i) => StreamBuilder<int>(
              stream: wm.currentFrontImageController.stream,
              builder: (context, snapshot) {
                return AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: wm.currentPageIndex == i ? 1 : 0.7,
                  child: GestureDetector(
                    onTap: () => wm.onCarouselItemTap(i),
                    child: CarouselItem(
                      image: wm.images.toList()[i],
                      isFrontImage: wm.currentPageIndex == i,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
