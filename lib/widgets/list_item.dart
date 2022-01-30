import 'package:cryptotracker/services/local_database_service.dart';
import 'package:flutter/material.dart';

import 'package:cryptotracker/models/coin.dart';
import 'package:cryptotracker/screens/detail.dart';
import 'package:cryptotracker/ui/colorscheme.dart';

class ListItem extends StatefulWidget {
  final Coin coin;
  final LocalDatabaseService dbService;

  const ListItem(
    Key? key,
    this.coin,
    this.dbService,
  ) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkFavorite().then((result) {
      setState(() {
        _isFavorite = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              widget.coin.name,
            ),
          ),
          if (widget.coin.currentPriceUSD != null)
            Expanded(
              child: Text(
                '\$' + widget.coin.currentPriceUSD.toString(),
              ),
            ),
        ],
      ),
      leading: Image.network(widget.coin.image.toString()),
      trailing: IconButton(
        icon: Icon(
          _isFavorite ? Icons.favorite : Icons.favorite_border,
          color: _isFavorite ? Colors.red : null,
        ),
        onPressed: () => _toggleFavorite(widget.coin.coinID),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              coinID: widget.coin.coinID,
              coinName: widget.coin.name,
            ),
          ),
        );
      },
      focusColor: Colorscheme.ceruleanCrayola,
    );
  }

  void _toggleFavorite(String coinID) {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        widget.dbService.removeFavorite(coinID);
      } else {
        _isFavorite = true;
        widget.dbService.addFavorite(coinID);
      }
    });
  }

  Future<bool> checkFavorite() async {
    return await widget.dbService.favoriteExists(widget.coin.coinID);
  }
}
