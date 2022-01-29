class Coin {
  final String coinID;
  final String name;
  final String symbol;
  final String? image;
  final num? currentPriceCZK;
  final num? currentPriceUSD;

  Coin({
    required this.coinID,
    required this.name,
    required this.symbol,
    this.image,
    this.currentPriceCZK,
    this.currentPriceUSD,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      coinID: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      image: json['image']['small'],
      currentPriceCZK: json['market_data']['current_price']['czk'],
      currentPriceUSD: json['market_data']['current_price']['usd'],
    );
  }
}
