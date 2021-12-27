
import 'dart:convert';
import 'package:currency_pairs/app/activities/add_currency_activity/domain/models/CurrencyPairSelect.dart';
import 'package:currency_pairs/services/data/CurrencyPair.dart';
import 'package:currency_pairs/services/implementation/CurRateHttp.dart';
import 'package:currency_pairs/utils/CurrencyParser.dart';
import 'package:http/http.dart' as http;

class CurrencyOutRepository {
  Future<List<CurrencyPairSelect>> getCurrencyList() async {
    var Response = await CurRateHttp().getCurrencyList();
    List<dynamic> body = jsonDecode(Response.body)["data"];
    if (Response.statusCode == 200) {
      var currencyPairs = <CurrencyPairSelect>[];
      for (var pair in body) {
        CurrencyPair curPair = CurrencyParser.parsePair(pair);
        currencyPairs.add(CurrencyPairSelect(
            curPair.currencyFrom, curPair.currencyTo, false));
      }
      return currencyPairs;
    }
    return [];
  }
}
