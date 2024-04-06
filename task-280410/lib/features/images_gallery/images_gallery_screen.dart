import 'package:flutter/material.dart';
import 'package:task_280410/features/images_gallery/widgets/gallery_app_bar.dart';
import 'package:task_280410/features/images_gallery/widgets/images_gridview.dart';

/// Виджет окна галереи изображений
class ImagesGalleryScreen extends StatelessWidget {
  ///Окно галереи изображений
  const ImagesGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: GalleryAppBar(),
        body: ImagesGridview(),
      ),
    );
  }
}
