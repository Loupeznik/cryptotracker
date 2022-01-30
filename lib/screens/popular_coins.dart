import 'package:cryptotracker/models/coin.dart';
import 'package:cryptotracker/services/coingecko_service.dart';
import 'package:cryptotracker/services/local_database_service.dart';
import 'package:cryptotracker/widgets/coin_list.dart';
import 'package:flutter/material.dart';

class PopularCoinsScreen extends StatefulWidget {
  final LocalDatabaseService dbService;

  const PopularCoinsScreen({Key? key, required this.dbService})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PopularCoinsScreenState();
}

class _PopularCoinsScreenState extends State<PopularCoinsScreen> {
  final CoingeckoService _coingeckoService = CoingeckoService();
  late Future<List<Coin>> coins;

  @override
  void initState() {
    super.initState();
    coins = _coingeckoService.getPopularCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoinList(
        coins: coins,
        dbService: widget.dbService,
      ),
    );
  }
}
