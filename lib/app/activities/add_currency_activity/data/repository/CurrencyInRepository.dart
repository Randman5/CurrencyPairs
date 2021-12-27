
import 'package:currency_pairs/app/activities/add_currency_activity/domain/models/CurrencyPairSelect.dart';
import 'package:currency_pairs/services/implementation/CurrencyPairSp.dart';

class CurrencyInRepository {

  Future<List<CurrencyPairSelect>> getCurrencyList() async {
    var currencyPairs = await CurrencyPairSp().getCurrencyPairs();
    var currencyPairSelect = <CurrencyPairSelect>[];
    for(var pair in currencyPairs) {
      currencyPairSelect.add(CurrencyPairSelect(pair.currencyFrom, pair.currencyTo, true));
    }
    return currencyPairSelect;
  }

  Future<bool> saveCurrencyList(List<CurrencyPairSelect> save) async {
    return await CurrencyPairSp().setCurrencyPairs(save);
  }
}
