
import 'package:currency_pairs/app/activities/MainActivity/data/repository/CurrencyInRepository.dart';
import 'package:currency_pairs/services/data/CurrencyPair.dart';

class DismissToRight {
    void run(List<CurrencyPair> pairs) {
      CurrencyInRepository().saveCurrencyList(pairs);
    }
}