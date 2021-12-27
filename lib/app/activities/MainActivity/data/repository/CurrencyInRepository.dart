
import 'package:currency_pairs/services/data/CurrencyPair.dart';
import 'package:currency_pairs/services/implementation/CurrencyPairSp.dart';

class CurrencyInRepository {
  Future<List<CurrencyPair>> getCurrencyList() async {
    return await CurrencyPairSp().getCurrencyPairs();
  }
}
