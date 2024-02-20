import 'package:injectable/injectable.dart';
import 'package:task_280049/core/logic/objects/objects.dart';
import 'package:task_280049/core/logic/repositories/colors_repository.dart';

/// Варианты использования   работы с цветами.
@singleton
class ColorsUseCase {
  /// Экземпляр репозитория по работе с цветами
  final IColorsRepository repository;

  ///Объект вариантов использования работы с цветами
  ColorsUseCase(this.repository);

  /// Получить доступные для взаимодействия цвета
  Future<List<ColorEntity>> fetchColors() {
    // Вставлена небольшая задержка. чтобы было видно экран загрузки, требуемый в ТЗ
    return Future.delayed(const Duration(seconds: 2)).then((_) => repository.fetchColors());
  }
}
