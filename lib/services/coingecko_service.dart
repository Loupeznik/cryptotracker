import 'dart:convert';

import 'package:cryptotracker/models/coin.dart';
import 'package:http/http.dart' as http;

class CoingeckoService {
  static const String _baseUrl = 'https://api.coingecko.com/api/v3/';

  Future<Coin> getCoinDetails(String coinID) async {
    final response = await http.get(Uri.parse(_baseUrl + 'coins/' + coinID));

    if (response.statusCode == 200) {
      return Coin.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch coin');
    }
  }

  Future<List<Coin>> getPopularCoins() async {
    final response = await http.get(Uri.parse(_baseUrl + 'search/trending'));

    throw UnimplementedError();
  }

  Future<List<Coin>> getAllCoins() async {
    final response = await http.get(Uri.parse(_baseUrl + 'coins/list'));

    throw UnimplementedError();
  }
}
