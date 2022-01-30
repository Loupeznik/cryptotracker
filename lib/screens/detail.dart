import 'package:cryptotracker/ui/colorscheme.dart';
import 'package:cryptotracker/widgets/coin_detail_tile.dart';
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
              var data = snapshot.data!;
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: IntrinsicWidth(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '${data.name} (${data.symbol})'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colorscheme.blueGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.network(
                                data.image.toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CoinDetailTile(
                              title: 'Price (USD)',
                              value: '\$${data.currentPriceUSD.toString()}',
                            ),
                            CoinDetailTile(
                              title: 'Price (CZK)',
                              value: '\$${data.currentPriceCZK.toString()}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
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
