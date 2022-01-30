import 'package:cryptotracker/services/local_database_service.dart';
import 'package:flutter/material.dart';

import 'package:cryptotracker/models/coin.dart';

import 'list_item.dart';

class CoinList extends StatelessWidget {
  final Future<List<Coin>> coins;
  final LocalDatabaseService dbService;

  const CoinList({
    Key? key,
    required this.coins,
    required this.dbService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Coin>>(
        future: coins,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Text('No coins found');
            }
            return ListView(
              children: [
                for (var item in snapshot.data!)
                  ListItem(null, item, dbService),
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
