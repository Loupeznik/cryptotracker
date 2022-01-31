class Coin {
  final String coinID;
  final String name;
  final String symbol;
  final String? image;
  final num? currentPriceCZK;
  final num? currentPriceUSD;
  final num? dailyHighUSD;
  final num? dailyLowUSD;
  final num? dailyPriceChangeUSD;
  final num? dailyPriceChangePercentage;
  final num? weeklyPriceChangePercentage;
  final num? monthlyPriceChangePercentage;

  Coin({
    required this.coinID,
    required this.name,
    required this.symbol,
    this.image,
    this.currentPriceCZK,
    this.currentPriceUSD,
    this.dailyHighUSD,
    this.dailyLowUSD,
    this.dailyPriceChangeUSD,
    this.dailyPriceChangePercentage,
    this.weeklyPriceChangePercentage,
    this.monthlyPriceChangePercentage,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      coinID: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      image: json['image']['small'],
      currentPriceCZK: json['market_data']['current_price']['czk'],
      currentPriceUSD: json['market_data']['current_price']['usd'],
      dailyLowUSD: json['market_data']['low_24h']['usd'],
      dailyHighUSD: json['market_data']['high_24h']['usd'],
      dailyPriceChangeUSD: json['market_data']['price_change_24h_in_currency']
          ['usd'],
      dailyPriceChangePercentage: json['market_data']
          ['price_change_percentage_24h'],
      weeklyPriceChangePercentage: json['market_data']
          ['price_change_percentage_7d'],
      monthlyPriceChangePercentage: json['market_data']
          ['price_change_percentage_30d'],
    );
  }

  factory Coin.fromJsonPopular(Map<String, dynamic> json) {
    return Coin(
      coinID: json['item']['id'],
      name: json['item']['name'],
      symbol: json['item']['symbol'],
      image: json['item']['small'],
    );
  }
}
