
import 'package:currency_pairs/app/activities/MainActivity/data/repository/CurrencyInRepository.dart';
import 'package:currency_pairs/app/activities/MainActivity/data/repository/CurrencyOutRepository.dart';
import 'package:currency_pairs/app/activities/MainActivity/domain/models/CurrencyPairRate.dart';
import 'package:currency_pairs/services/data/CurrencyPair.dart';
import 'package:flutter/material.dart';

class GetTrackedCurrencyRate {
  void run(State<StatefulWidget> widget, List<CurrencyPair> currencyList) =>
      _getCurrencyPairRateList(currencyList)
          .then((value) => widget.setState(() {
                currencyList.clear();
                currencyList.addAll(value);
              }));

  Future<List<CurrencyPairRate>> _getCurrencyPairRateList(
      List<CurrencyPair> currencyList) async {
    List<CurrencyPair> saved = await CurrencyInRepository().getCurrencyList();
    List<CurrencyPairRate> tracked =
        await CurrencyOutRepository().getCurRateList(saved);
    return tracked;
  }
}
