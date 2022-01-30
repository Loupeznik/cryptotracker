import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class LocalDatabase {
  Database? _db;

  Future<Database> get database async {
    WidgetsFlutterBinding.ensureInitialized();

    if (_db != null) {
      return _db!;
    }

    _db = await init();
    return _db!;
  }

  init() async {
    var documentDirectory = await getApplicationDocumentsDirectory();
    var path = p.join(documentDirectory.path, 'cryptotracker.db');
    var db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Favorites(itemID INTEGER PRIMARY KEY, coinID TEXT)');
  }
}
