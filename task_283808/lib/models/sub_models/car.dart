import '../../lib.dart';

///
class Car {
  ///
  String id;
  ///
  int number;
  ///
  Pilot pilot;
  ///
  CarMarksEnum mark;

  Car({
    required this.id,
    required this.number,
    required this.pilot,
    required this.mark,
  });
}
