
import 'package:currency_pairs/app/activities/MainActivity/domain/models/CurrencyPairRate.dart';
import 'package:currency_pairs/utils/CurrencyParser.dart';
import 'package:flutter/material.dart';

class CurrencyValueView extends StatelessWidget {
  final CurrencyPairRate currencyPair;
  final TextStyle textStyle;
  final Color BackgroundColor;

  const CurrencyValueView(
      {Key? key,
      required this.currencyPair,
      required this.textStyle,
      required this.BackgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 30, 0, 30),
            child: Text(
              "${currencyPair.currencyFrom} -> ${currencyPair.currencyTo}",
              style: textStyle,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 20, 30),
            child: Text(
              "${CurrencyParser.dp(currencyPair.rate, 1)}",
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
