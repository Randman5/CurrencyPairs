
class CurrencyPair {
  final String _key;

  String get key => _key;

  late String _currencyFrom;

  String get currencyFrom => _currencyFrom;

  set currencyFrom(String currencyFrom) =>
      _currencyFrom = currencyFrom.toUpperCase();

  late String _currencyTo;

  String get currencyTo => _currencyTo;

  set currencyTo(String currencyFrom) => _currencyTo = currencyTo.toUpperCase();

  CurrencyPair(
    this._currencyFrom,
    this._currencyTo,
  ) : _key = "$_currencyFrom$_currencyTo";

  @override
  String toString() {
    return key;
  }

  @override
  bool operator ==(Object other) {
    return other is CurrencyPair && this.key == other.key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}
