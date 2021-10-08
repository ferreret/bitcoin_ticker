import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<int> getCoinData() async {
    var url = Uri.https("https://rest.coinapi.io/v1", "exchangerate/BTC/USD");
    final response = await http.get(
      url,
      headers: {'X-CoinAPI-Key': '73034021-THIS-IS-SAMPLE-KEY'},
    );

    final responseJSON = convert.jsonDecode(response.body);
    double rate = responseJSON['rate'];

    return rate.toInt();
  }
}
