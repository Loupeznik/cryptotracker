import 'package:cryptotracker/db/local_database.dart';
import 'package:cryptotracker/models/favorite.dart';

class LocalDatabaseService {
  final _localDb = LocalDatabase();

  Future<void> addFavorite(String coinID) async {
    final db = await _localDb.database;

    if (await favoriteExists(coinID)) {
      return;
    }

    db.insert('favorites', Favorite(null, coinID).toMap());
  }

  Future<void> removeFavorite(String coinID) async {
    final db = await _localDb.database;

    if (!await favoriteExists(coinID)) {
      return;
    }

    db.delete('favorites', where: 'coinID = ?', whereArgs: [coinID]);
  }

  Future<bool> favoriteExists(String coinID) async {
    final db = await _localDb.database;
    var result =
        await db.query('favorites', where: 'coinID = ?', whereArgs: [coinID]);

    if (result.isEmpty) {
      return false;
    }

    return true;
  }

  Future<List<String>> getAllFavorites() async {
    final db = await _localDb.database;
    List<String> list = List.empty(growable: true);
    var results = await db.query('favorites', columns: ['coinID']);
    for (var result in results) {
      list.add(result.values.first.toString());
    }

    return list;
  }
}
