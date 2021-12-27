
import 'package:flutter/material.dart';

class NavigateToCurrencyActivity {
  void run(BuildContext context, Function? callback) {
    Navigator.pushNamed(context, '/AddCurrencyActivity')
        .then((value) => callback!());
  }
}
