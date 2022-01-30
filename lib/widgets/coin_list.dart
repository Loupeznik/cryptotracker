import 'package:flutter/material.dart';

import 'package:cryptotracker/models/coin.dart';

import 'list_item.dart';

class CoinList extends StatelessWidget {
  final Future<List<Coin>> coins;

  const CoinList({
    Key? key,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Coin>>(
        future: coins,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                for (var item in snapshot.data!) ListItem(null, item),
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('An error has occured');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
