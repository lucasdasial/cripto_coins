import 'package:cripto_coins/core/utils/currency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Should return BRL currency", () {
    expect(Currency.toBRL(1234500), "R\$\xa01.234.500,00");
    expect(Currency.toBRL(12300), "R\$\xa012.300,00");
    expect(Currency.toBRL(200), "R\$\xa0200,00");
    expect(Currency.toBRL(0.5), "R\$\xa00,50");
    expect(Currency.toBRL(-1), "-R\$\xa01,00");
  });
}
