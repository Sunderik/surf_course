import 'package:task_285473/core/constants/strings_constants.dart';

enum Pets {
  doge(StringsConstants.dog, StringsConstants.dogAssetPath, true),
  cat(StringsConstants.cat, StringsConstants.catAssetPath, true),
  parrot(StringsConstants.parrot, StringsConstants.parrotAssetPath, false),
  hamster(StringsConstants.hamster, StringsConstants.hamsterAssetPath, false);

  final String label;
  final String assetPath;
  final bool needVaccinations;

  const Pets(this.label, this.assetPath, this.needVaccinations);
}
