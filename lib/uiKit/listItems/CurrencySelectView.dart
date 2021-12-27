
import 'package:currency_pairs/app/activities/add_currency_activity/domain/models/CurrencyPairSelect.dart';
import 'package:flutter/material.dart';

class CurrencySelectView extends StatefulWidget {
  const CurrencySelectView(
      {Key? key,
      required this.currencyPair,
      required this.textStyle,
      required this.BackgroundColor})
      : super(key: key);

  final CurrencyPairSelect currencyPair;
  final TextStyle textStyle;
  final Color BackgroundColor;

  @override
  _CurrencyValueSelectViewState createState() =>
      _CurrencyValueSelectViewState();
}

class _CurrencyValueSelectViewState extends State<CurrencySelectView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.BackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 30, 0, 30),
            child: Text(
              "${widget.currencyPair.currencyFrom} -> ${widget.currencyPair.currencyTo}",
              style: widget.textStyle,
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 20, 30),
              child: Checkbox(
                  value: widget.currencyPair.isSelected,
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.all(Colors.grey),
                  activeColor: Colors.grey,
                  onChanged: (flag) {
                    setState(() {
                      widget.currencyPair.isSelected = flag!;
                    });
                  })),
        ],
      ),
    );
  }
}
