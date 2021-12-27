
import 'dart:math';
import 'package:currency_pairs/services/data/CurrencyPair.dart';
import 'package:currency_pairs/app/activities/MainActivity/domain/models/CurrencyPairRate.dart';
import 'package:currency_pairs/app/activities/add_currency_activity/domain/models/CurrencyPairSelect.dart';

class CurrencyParser {
  static List<CurrencyPair> parseSpPairs(String pairs) {
    List<CurrencyPair> parsedPairs = <CurrencyPair>[];
    if (pairs.isNotEmpty) {
      var splittedPairs = pairs.split(",");
      for (var pair in splittedPairs) {
        parsedPairs.add(parsePair(pair));
      }
    }
    return parsedPairs;
  }

  static CurrencyPair parsePair(String pair) {
    String from = pair.substring(0, 3);
    String to = pair.substring(3);
    return CurrencyPair(from, to);
  }

  static List<CurrencyPairRate> parseRatePairs(Map<String, String> pairs) {
    List<CurrencyPairRate> parsedPairs = <CurrencyPairRate>[];

    for (var pair in pairs.entries) {
      CurrencyPair tmpPair = parsePair(pair.key);
      parsedPairs.add(CurrencyPairRate(tmpPair.currencyFrom,
          tmpPair.currencyFrom, double.parse(pair.value)));
    }

    return parsedPairs;
  }

  static List<CurrencyPairSelect> parseSelectPairs(List<String> pairs) {
    List<CurrencyPairSelect> parsedPairs = <CurrencyPairSelect>[];

    for (var pair in pairs) {
      CurrencyPair tmpPair = parsePair(pair);
      parsedPairs.add(CurrencyPairSelect(
          tmpPair.currencyFrom, tmpPair.currencyFrom, false));
    }

    return parsedPairs;
  }

  static dp(double val, int places) {
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }
}
