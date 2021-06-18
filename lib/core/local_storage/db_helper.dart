import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const _DATA_BASE_NAME = "rooms.db";
  static const _DATA_BASE_VERSION = 1;
  static const _TABLE = 'rooms';
  static const COLUMN_ID = 'id';
  static const COLUMN_IND = 'ind';
  static const COLUMN_TYPE = 'type';
  static const COLUMN_NAME = 'name';
  static const COLUMN_IMG = 'img';
  static const COLUMN_DESCRIP = 'descrip';
  static const COLUMN_SWITCH = 'switch';

  DbHelper._();

  static final DbHelper instance = DbHelper._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _DATA_BASE_NAME);
    return await openDatabase(path,
        version: _DATA_BASE_VERSION, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_TABLE (
            $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_IND INTEGER,
            $COLUMN_TYPE INTEGER,
            $COLUMN_IMG TEXT,
            $COLUMN_NAME TEXT,
            $COLUMN_DESCRIP TEXT,
            $COLUMN_SWITCH TEXT
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_TABLE, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(Map<String, dynamic> row, int ind) async {
    Database db = await instance.database;
    return await db.update(_TABLE, row,
        where: 'id = ?',
        whereArgs: [ind],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(_TABLE, orderBy: "id");
  }
}
