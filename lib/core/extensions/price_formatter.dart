import 'package:intl/intl.dart';

// 600000 -> 6,000,000 تومان
extension NumberFormatting on num {
  String priceFormatter() {
    final formatter = NumberFormat('#,###');
    final formattedString = formatter.format(this);
    if (this > 0) {
      return formattedString;
    } else {
      return 'رایگان';
    }
  }
}
