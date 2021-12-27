
import 'package:currency_pairs/app/activities/add_currency_activity/data/repository/CurrencyInRepository.dart';
import 'package:currency_pairs/app/activities/add_currency_activity/data/repository/CurrencyOutRepository.dart';
import 'package:currency_pairs/app/activities/add_currency_activity/domain/models/CurrencyPairSelect.dart';
import 'package:flutter/cupertino.dart';

class GetCurrencyList {
  void run(
      State<StatefulWidget> widget, List<CurrencyPairSelect> currencyList) {
    getAllPairsWithSelected().then((value) => widget.setState(() {
          currencyList.clear();
          currencyList.addAll(value);
        }));
  }

  Future<List<CurrencyPairSelect>> getAllPairsWithSelected() async {
    List<CurrencyPairSelect> saved =
        await CurrencyInRepository().getCurrencyList();
    List<CurrencyPairSelect> getOut =
        await CurrencyOutRepository().getCurrencyList();

    if (getOut.isNotEmpty) {
      for (var out in getOut) {
        if (saved.contains(out)) {
          out.isSelected = true;
        }
      }
      return getOut;
    }

    return saved;
  }
}
