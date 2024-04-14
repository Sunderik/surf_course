import 'package:intl/intl.dart';

class StringUtils {
  static final email = RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,3}");

  static String dateFormat(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  static DateTime dateReformat(String date) {
    final numbers = date.split('.').map((e) => int.parse(e)).toList();
    return DateTime(numbers[2], numbers[1], numbers[0]);
  }
}
