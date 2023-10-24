import 'package:task_283808/enums/access_levels_enum.dart';

///
class PassCard {
  ///
  String id;
  ///
  Set<AccessLevelsEnum> accessLevels;

  PassCard({
    required this.id,
    this.accessLevels = const {},
  });
}
