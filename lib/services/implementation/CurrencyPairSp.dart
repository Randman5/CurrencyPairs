
import 'package:currency_pairs/services/data/CurrencyPair.dart';
import 'package:currency_pairs/utils/CurrencyParser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyPairSp {
  static const CURRENCY_PAIRS = "CurrencyPairs";

  Future<List<CurrencyPair>> getCurrencyPairs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringPairs = prefs.getString(CURRENCY_PAIRS) ?? "";
    List<CurrencyPair> pairsList = CurrencyParser.parseSpPairs(stringPairs);
    return pairsList;
  }

  Future<bool> setCurrencyPairs(List<CurrencyPair> pairs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> pairsStringList = <String>[];
    for (var element in pairs) {
      pairsStringList.add(element.key);
    }
    bool result =
        await prefs.setString(CURRENCY_PAIRS, pairsStringList.join(","));
    return result;
  }
}
