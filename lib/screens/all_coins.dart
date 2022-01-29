import 'package:cryptotracker/models/coin.dart';
import 'package:cryptotracker/services/coingecko_service.dart';
import 'package:flutter/material.dart';

class AllCoinsScreen extends StatefulWidget {
  const AllCoinsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AllCoinsScreenState();
}

class _AllCoinsScreenState extends State<AllCoinsScreen> {
  final CoingeckoService _coingeckoService = CoingeckoService();
  late Future<Coin> coin;

  @override
  void initState() {
    super.initState();
    coin = _coingeckoService.getCoinDetails("bitcoin");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: FutureBuilder<Coin>(
          future: coin,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.currentPriceUSD.toString());
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
