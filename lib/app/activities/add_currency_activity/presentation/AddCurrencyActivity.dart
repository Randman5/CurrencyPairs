
import 'package:currency_pairs/app/activities/add_currency_activity/domain/usecase/GetCurrencyList.dart';
import 'package:currency_pairs/app/activities/add_currency_activity/domain/usecase/SaveSelectedCurrencyPairs.dart';
import 'package:currency_pairs/res/string/RString.dart';
import 'package:currency_pairs/app/activities/add_currency_activity/domain/models/CurrencyPairSelect.dart';
import 'package:currency_pairs/uiKit/listItems/CurrencySelectView.dart';
import 'package:flutter/material.dart';

class AddCurrencyActivity extends StatefulWidget {
  const AddCurrencyActivity({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AddCurrencyActivity> createState() => _AddCurrencyActivityState();
}

class _AddCurrencyActivityState extends State<AddCurrencyActivity> {
  List<CurrencyPairSelect> currencyList = [];

  @override
  void initState() {
    super.initState();
    GetCurrencyList().run(this, currencyList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 22),
          ),
          elevation: 0,
          actions: <Widget>[
            TextButton(
                onPressed: () =>
                    SaveSelectedCurrencyPairs().run(context, currencyList),
                child: const Text(
                  RString.ADD,
                  style: TextStyle(color: Colors.black),
                )),
          ],
          bottom: PreferredSize(
              child: Container(
                color: Colors.black,
                height: 1.0,
              ),
              preferredSize: const Size.fromHeight(1.0)),
        ),
        body: Container(
            color: Colors.white,
            child: ListView.separated(
                itemCount: currencyList.length,
                itemBuilder: (context, index) {
                  CurrencyPairSelect item = currencyList[index];
                  return CurrencySelectView(
                    currencyPair: item,
                    BackgroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 2.0,
                    color: Colors.grey,
                  );
                })));
  }
}
