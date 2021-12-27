
import 'package:currency_pairs/app/activities/add_currency_activity/presentation/AddCurrencyActivity.dart';
import 'package:currency_pairs/res/colors/RMaterialColor.dart';
import 'package:currency_pairs/res/string/RString.dart';
import 'package:flutter/material.dart';

import 'activities/MainActivity/presentation/MainActivity.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: RString.APP_NAME,
      theme: ThemeData(
        primarySwatch: RMaterialColor.PrimarySwatchColor,
      ),
      routes: {
        '/': (context) => const MainActivity(title: RString.APP_NAME),
        '/AddCurrencyActivity': (context) =>
            const AddCurrencyActivity(title: RString.APP_NAME),
      },
    );
  }
}
