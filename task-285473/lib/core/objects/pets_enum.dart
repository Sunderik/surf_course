import 'package:task_285473/core/constants/assets_paths.dart';
import 'package:task_285473/core/constants/strings_constants.dart';

/// Перечисление доступных типов животных
enum Pets {
  /// Собака
  doge(StringsConstants.dog, AssetsPaths.dogAssetPath, true),

  /// Кошка
  cat(StringsConstants.cat, AssetsPaths.catAssetPath, true),

  /// Попугай
  parrot(StringsConstants.parrot, AssetsPaths.parrotAssetPath, false),

  /// Хомяк
  hamster(StringsConstants.hamster, AssetsPaths.hamsterAssetPath, false);

  /// Название типа
  final String label;

  /// Путь к иконке
  final String assetPath;

  /// Признак того, что животное может иметь прививки
  final bool mayHaveVaccinations;

  /// Доступных типов животных
  const Pets(this.label, this.assetPath, this.mayHaveVaccinations);
}
