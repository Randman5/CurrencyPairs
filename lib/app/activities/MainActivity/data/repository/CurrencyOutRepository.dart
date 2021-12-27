
import 'dart:convert';
import 'package:currency_pairs/app/activities/MainActivity/domain/models/CurrencyPairRate.dart';
import 'package:currency_pairs/services/data/CurrencyPair.dart';
import 'package:currency_pairs/services/implementation/CurRateHttp.dart';
import 'package:currency_pairs/utils/CurrencyParser.dart';
import 'package:http/http.dart' as http;

class CurrencyOutRepository {
  Future<List<CurrencyPairRate>> getCurRateList(
      List<CurrencyPair> pairs) async {
    var Response = await CurRateHttp().getCurRate(pairs);
    if (Response.statusCode == 200 &&
        jsonDecode(Response.body)["data"] is Map<dynamic, dynamic>) {
      Map<dynamic, dynamic> body = jsonDecode(Response.body)["data"];
      var currencyPairs = <CurrencyPairRate>[];
      for (var pair in body.entries) {
        CurrencyPair curPair = CurrencyParser.parsePair(pair.key);
        currencyPairs.add(CurrencyPairRate(curPair.currencyFrom,
            curPair.currencyTo, double.parse(pair.value)));
      }
      return currencyPairs;
    }
    return [];
  }
}
