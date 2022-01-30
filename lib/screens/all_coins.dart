import 'package:cryptotracker/models/coin.dart';
import 'package:cryptotracker/services/coingecko_service.dart';
import 'package:cryptotracker/services/local_database_service.dart';
import 'package:cryptotracker/widgets/coin_list.dart';
import 'package:flutter/material.dart';

class AllCoinsScreen extends StatefulWidget {
  final LocalDatabaseService dbService;

  const AllCoinsScreen({Key? key, required this.dbService}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AllCoinsScreenState();
}

class _AllCoinsScreenState extends State<AllCoinsScreen> {
  final CoingeckoService _coingeckoService = CoingeckoService();
  late Future<List<Coin>> coins;

  @override
  void initState() {
    super.initState();
    coins = _coingeckoService.getAllCoins();
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
