import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280410/core/domain/models/image_model.dart';
import 'package:task_280410/features/images_carousel/images_carousel.dart';
import 'package:task_280410/features/images_gallery/images_gallery_widget_model.dart';
import 'package:task_280410/features/images_gallery/widgets/gridview_item.dart';

/// Виджет сетки изображений окна галереи изображений
class ImagesGridview extends StatelessWidget {
  /// Сетка изображений окна галереи изображений
  const ImagesGridview({super.key});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<ImagesGalleryWidgetModel>(context, listen: false);

    return StreamBuilder<List<ImageModel>?>(
        stream: wm.imagesController.stream,
        builder: (context, snapshot) {
          if (wm.images == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final images = wm.images ?? [];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: images.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final image = images.toList()[index];
                    return GridViewItem(
                      image: image,
                      onTap: () {
                        Navigator.push<int>(
                          context,
                          MaterialPageRoute(builder: (_) => ImageCarousel(openedImage: image)),
                        );
                      },
                    );
                  }),
            );
          }
        });
  }
}
