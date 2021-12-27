import 'dart:async';
import 'package:currency_pairs/app/activities/MainActivity/domain/usecase/DismissToRight.dart';
import 'package:currency_pairs/app/activities/MainActivity/domain/usecase/GetCurrencyRate.dart';
import 'package:currency_pairs/app/activities/MainActivity/domain/usecase/NavigateToCurrencyActivity.dart';
import 'package:currency_pairs/app/activities/MainActivity/domain/models/CurrencyPairRate.dart';
import 'package:currency_pairs/uiKit/listItems/CurrencyValueView.dart';
import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  List<CurrencyPairRate> currencyList = [];

  @override
  void initState() {
    super.initState();
    updateTrackedList();
    timerUpdate();
  }

  void updateTrackedList() {
    GetTrackedCurrencyRate().run(this, currencyList);
  }

  void timerUpdate() {
    final a = Timer.periodic(Duration(minutes: 10), (tick) {
      updateTrackedList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 22),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => NavigateToCurrencyActivity()
                    .run(context, updateTrackedList),
                icon: Icon(Icons.add))
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
          child: RefreshIndicator(
              color: Colors.grey,
              onRefresh: () async =>
                  GetTrackedCurrencyRate().run(this, currencyList),
              child: ListView.separated(
                  itemCount: currencyList.length,
                  itemBuilder: (context, index) {
                    CurrencyPairRate item = currencyList[index];
                    return Dismissible(
                      key: Key(item.key),
                      child: CurrencyValueView(
                        currencyPair: item,
                        BackgroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) {
                        if (direction == DismissDirection.startToEnd) {
                          setState(() {
                            currencyList.removeAt(index);
                            DismissToRight().run(currencyList);
                          });
                        }
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 2.0,
                      color: Colors.grey,
                    );
                  })),
        ));
  }
}
