import 'package:injectable/injectable.dart';
import 'package:task_280049/core/logic/objects/objects.dart';
import 'package:task_280049/core/logic/repositories/colors_repository.dart';

@singleton
class ColorsUseCase {
  final IColorsRepository repository;

  ColorsUseCase(this.repository);

  Future<List<ColorEntity>> fetchColors() {
    return Future.delayed(const Duration(seconds: 2)).then((value) => repository.fetchColors());
  }
}
