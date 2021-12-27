
import 'package:currency_pairs/app/activities/add_currency_activity/data/repository/CurrencyInRepository.dart';
import 'package:currency_pairs/app/activities/add_currency_activity/domain/models/CurrencyPairSelect.dart';
import 'package:flutter/material.dart';

class SaveSelectedCurrencyPairs {
  void run(BuildContext context, List<CurrencyPairSelect> pairs) {
    List<CurrencyPairSelect> toSave = <CurrencyPairSelect>[];
    for (var pair in pairs) {
      if (pair.isSelected) {
        toSave.add(pair);
      }
    }
    CurrencyInRepository().saveCurrencyList(toSave).then((value) => {
          if (value) {Navigator.pop(context)}
        });
  }
}
