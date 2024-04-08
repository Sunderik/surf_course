import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280410/core/domain/models/app_state_model.dart';
import 'package:task_280410/core/network/images_repository.dart';
import 'package:task_280410/core/network/network_client.dart';
import 'package:task_280410/features/images_gallery/images_gallery_screen.dart';
import 'package:task_280410/features/images_gallery/images_gallery_widget_model.dart';

///Виджет обертка для окна галереи изображений
class ImagesGallery extends StatelessWidget {
  const ImagesGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, state, child) => ProxyProvider0<ImagesGalleryWidgetModel>(
        update: (context, bloc) => ImagesGalleryWidgetModel(ImagesRepositoryImp(HttpClient()), appState: state)..init(),
        dispose: (context, wm) => wm.dispose(),
        child: const ImagesGalleryScreen(),
      ),
    );
  }
}
