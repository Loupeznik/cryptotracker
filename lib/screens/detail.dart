import 'package:cryptotracker/ui/colorscheme.dart';
import 'package:flutter/material.dart';

import 'package:cryptotracker/models/coin.dart';
import 'package:cryptotracker/services/coingecko_service.dart';

class DetailScreen extends StatelessWidget {
  final CoingeckoService _coingeckoService = CoingeckoService();
  final String coinID;
  final String? coinName;

  DetailScreen({Key? key, required this.coinID, this.coinName})
      : super(key: key);

  late final Future<Coin> coin = _coingeckoService.getCoinDetails(coinID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? coinID),
        backgroundColor: Colorscheme.darkCornflowerBlue,
      ),
      body: Center(
        child: FutureBuilder<Coin>(
          future: coin,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.currentPriceUSD.toString());
            } else if (snapshot.hasError) {
              return const Text('An error has occured');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
