import 'package:cryptotracker/models/coin.dart';
import 'package:cryptotracker/widgets/coin_list.dart';
import 'package:flutter/material.dart';

import 'package:cryptotracker/services/coingecko_service.dart';
import 'package:cryptotracker/services/local_database_service.dart';

class MyCoinsScreen extends StatefulWidget {
  final LocalDatabaseService dbService;

  const MyCoinsScreen({
    Key? key,
    required this.dbService,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCoinsScreenState();
}

class _MyCoinsScreenState extends State<MyCoinsScreen> {
  final CoingeckoService _coingeckoService = CoingeckoService();

  late Future<List<Coin>> coins;

  @override
  void initState() {
    _loadCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: CoinList(
          coins: coins,
          dbService: widget.dbService,
        ),
        onRefresh: () => _refreshWidget(),
      ),
    );
  }

  Future<void> _refreshWidget() async {
    setState(() {
      _loadCoins();
    });
  }

  void _loadCoins() {
    coins = widget.dbService.getAllFavorites().then((result) {
      return _coingeckoService.getCoinsByID(result.toList());
    });
  }
}
