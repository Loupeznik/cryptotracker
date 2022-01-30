class Favorite {
  final int? itemID;
  final String coinID;

  Favorite(this.itemID, this.coinID);

  Map<String, dynamic> toMap() {
    return {
      'itemID': itemID,
      'coinID': coinID,
    };
  }
}
