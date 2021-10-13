import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const apikey = '54D8AD32-25F4-4260-B395-F8DFFB10B315';
const authority = 'rest.coinapi.io';
const uncodedPath = 'v1/exchangerate/';

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
  Future<Map<String, String>> getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};

    for (String cryptoItem in cryptoList) {
      var url = Uri.https(authority, '$uncodedPath$cryptoItem/$currency');
      final response = await http.get(
        url,
        headers: {'X-CoinAPI-Key': apikey},
      );

      if (response.statusCode == 200) {
        final responseJSON = convert.jsonDecode(response.body);
        double rate = responseJSON['rate'];
        cryptoPrices[cryptoItem] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }

    return cryptoPrices;
  }
}
