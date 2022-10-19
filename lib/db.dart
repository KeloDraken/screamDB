import 'dart:io';

import 'package:scream_db/constants.dart';
import 'package:scream_db/utils.dart';

class ScreamDB {
  String name = "";

  ScreamDB(String name) {
    try {
      this.name = _setUpName(name);
    } catch (e) {
      print(e);
    }
  }

  void createTable(Map<String, dynamic> table) {}

  void dropTable(String tableName) {}

  List<Map<String, dynamic>> getAllFromTable(String tableName) {
    return [{}];
  }

  Future<bool> deleteAllFromTable(String tableName) {
    return Future.value(true);
  }

  String _setUpName(String name) {
    String db = "";
    _checkDb(name).then((value) => db = value);
    return db;
  }

  Future<String> _checkDb(String dbName) async {
    final String userHomeDir = getUserHomeDir();
    String? dbName = stdin.readLineSync();
    String sep = Platform.pathSeparator;

    final String dbDir = "$userHomeDir$sep$screamDb$sep$dbName";

    bool pathExists = false;
    await Directory(dbDir).exists().then((value) => pathExists = value);

    if (pathExists) return Future.value(dbDir);
    throw NoSuchMethodError;
  }
}
