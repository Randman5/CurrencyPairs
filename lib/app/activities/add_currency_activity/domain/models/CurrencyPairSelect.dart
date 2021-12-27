
import 'package:currency_pairs/services/data/CurrencyPair.dart';

class CurrencyPairSelect extends CurrencyPair {
  bool _isSelected;

  bool get isSelected => _isSelected;

  set isSelected(bool isSelected) => _isSelected = isSelected;

  CurrencyPairSelect(String currencyFrom, String currencyTo, this._isSelected)
      : super(currencyFrom, currencyTo);

  @override
  int get hashCode {
    return super.hashCode;
  }
}
