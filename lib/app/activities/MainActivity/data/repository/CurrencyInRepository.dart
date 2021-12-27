
import 'package:currency_pairs/app/activities/MainActivity/domain/models/CurrencyPairRate.dart';
import 'package:currency_pairs/services/data/CurrencyPair.dart';
import 'package:currency_pairs/services/implementation/CurrencyPairSp.dart';

class CurrencyInRepository {
  Future<List<CurrencyPair>> getCurrencyList() async {
    return await CurrencyPairSp().getCurrencyPairs();
  }

  Future<bool> saveCurrencyList(List<CurrencyPair> save) async {
    return await CurrencyPairSp().setCurrencyPairs(save);
  }
}
