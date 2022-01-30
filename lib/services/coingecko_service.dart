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
      throw Exception('Failed to fetch coin data');
    }
  }

  Future<List<Coin>> getPopularCoins() async {
    final response = await http.get(Uri.parse(_baseUrl + 'search/trending'));

    if (response.statusCode == 200) {
      final parsed =
          jsonDecode(response.body)["coins"].cast<Map<String, dynamic>>();
      return parsed.map<Coin>((json) => Coin.fromJsonPopular(json)).toList();
    } else {
      throw Exception('Failed to fetch coin data');
    }
  }

  Future<List<Coin>> getAllCoins() async {
    final response = await http.get(Uri.parse(_baseUrl + 'coins'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Coin>((json) => Coin.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch coin data');
    }
  }
}
