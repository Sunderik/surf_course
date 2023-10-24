import 'package:task_283808/lib.dart';

///
class Sponsor {
  ///
  String name;

  ///
  CountryEnum country;

  ///
  Human head;

  ///
  double providedAssistance;

  Sponsor({
    required this.name,
    required this.country,
    required this.head,
    this.providedAssistance = 0.0,
  });
}
