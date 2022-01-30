import 'package:flutter/material.dart';

class CoinDetailTile extends StatelessWidget {
  final String title;
  final String value;

  const CoinDetailTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Text(value),
    );
  }
}
