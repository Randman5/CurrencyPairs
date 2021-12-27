
import 'package:currency_pairs/services/data/CurrencyPair.dart';

class CurrencyPairRate extends CurrencyPair {
  double _rate;

  double get rate => _rate;

  set rate(double rate) => _rate = rate;

  CurrencyPairRate(String currencyFrom, String currencyTo, this._rate)
      : super(currencyFrom, currencyTo);
}
