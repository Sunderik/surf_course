import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:task_280410/core/domain/models/app_state_model.dart';
import 'package:task_280410/core/domain/models/image_model.dart';
import 'package:task_280410/features/images_carousel/images_carousel_screen.dart';
import 'package:task_280410/features/images_carousel/images_carousel_widget_model.dart';

/// Виджет обертка для окна карусели изображений
class ImageCarousel extends StatelessWidget {
  /// Объект изображения переднего плана
  final ImageModel openedImage;

  const ImageCarousel({super.key, required this.openedImage});

  @override
  Widget build(BuildContext context) {
    timeDilation = 2; // Замедление открытия и сворачивания окна через hero анимацию

    return Consumer<AppStateModel>(
      builder: (context, state, child) => Provider<ImageCarouselWidgetModel>(
        create: (context) => ImageCarouselWidgetModel(appState: state, openedFrontImage: openedImage)..init(),
        dispose: (context, wm) => wm.dispose(),
        child: const ImageCarouselScreen(),
      ),
    );
  }
}
