import 'package:flutter/material.dart';

import 'package:cryptotracker/models/coin.dart';
import 'package:cryptotracker/screens/detail.dart';
import 'package:cryptotracker/ui/colorscheme.dart';

class ListItem extends StatefulWidget {
  final Coin coin;

  const ListItem(
    Key? key,
    this.coin,
  ) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _isFavorite = false;

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
    //TODO: Setup DB service, add to DB
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }
}
