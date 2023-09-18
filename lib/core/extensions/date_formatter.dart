import 'package:shamsi_date/shamsi_date.dart';

extension GregorianToJalali on String {
  String jalaliFormatter() {
    final DateTime gregorianDate = DateTime.parse(this);
    final Jalali jalaliDate = gregorianDate.toJalali();

    final int year = jalaliDate.year;
    final int month = jalaliDate.month;
    final int day = jalaliDate.day;

    if (month < 10 && day < 10) {
      return '$year/0$month/0$day';
    }
    if (month < 10) {
      return '$year/0$month/$day';
    }
    if (day < 10) {
      return '$year/$month/0$day';
    } else {
      return '$year/$month/$day';
    }
  }
}
