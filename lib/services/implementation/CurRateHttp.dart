
import 'package:currency_pairs/services/data/CurrencyPair.dart';
import 'package:currency_pairs/services/enums/CurRateConst.dart';
import 'package:currency_pairs/utils/GetRequestBuilder.dart';
import 'package:http/http.dart' as http;

class CurRateHttp {
  Future<http.Response> getCurRate(List<CurrencyPair> pairs) async {
    var client = http.Client();
    try {
      Uri url = GetRequestBuilder(CurRateConst.URL)
          .addParam("get", "rates")
          .addParam("pairs", pairs.join(","))
          .addParam("key", CurRateConst.API_KEY)
          .Build();
      var response = await client.get(url);
      return response;
    } finally {
      client.close();
    }
  }

  Future<http.Response> getCurrencyList() async {
    var client = http.Client();
    try {
      Uri url = GetRequestBuilder(CurRateConst.URL)
          .addParam("get", "currency_list")
          .addParam("key", CurRateConst.API_KEY)
          .Build();
      var response = await client.get(url);
      return response;
    } finally {
      client.close();
    }
  }
}
