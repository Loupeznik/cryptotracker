import 'package:cryptotracker/ui/colorscheme.dart';
import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key? key}) : super(key: key);
  final String _coingeckoIconUrl =
      'https://static.coingecko.com/s/thumbnail-007177f3eca19695592f0b8b0eabbdae282b54154e1be912285c9034ea6cbaf2.png';

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Text(
                  'Data provided by Coingecko',
                  style: TextStyle(
                    color: Colorscheme.blizzardBlue,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2.0,
                  ),
                ),
                Image.network(
                  _coingeckoIconUrl,
                  scale: 8,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            backgroundColor: Colorscheme.starCommandBlue,
          ),
        );
      },
      icon: const Icon(Icons.info),
      tooltip: 'Disclaimer',
    );
  }
}
