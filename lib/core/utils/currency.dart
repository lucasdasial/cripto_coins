import 'package:intl/intl.dart';

class Currency {
  static String toBRL(double value) {
    final currency = NumberFormat.simpleCurrency(locale: "pt_BR", name: "BRL");
    return currency.format(value);
  }
}
