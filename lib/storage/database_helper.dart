import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'links.db');

    // Open/create the database at a given path
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create the links table
        await db.execute(
          '''
          CREATE TABLE links (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            url TEXT
          )
          ''',
        );
      },
    );
  }

  Future<int> insertLink(Map<String, dynamic> link) async {
    Database? dbClient = await db;
    return await dbClient!.insert('links', link);
  }

  Future<List<Map<String, dynamic>>> getAllLinks() async {
    Database? dbClient = await db;
    return await dbClient!.query('links');
  }

  Future<int> updateLink(Map<String, dynamic> link) async {
    Database? dbClient = await db;
    return await dbClient!.update(
      'links',
      link,
      where: 'id = ?',
      whereArgs: [link['id']],
    );
  }

  Future<int> deleteLink(int id) async {
    Database? dbClient = await db;
    return await dbClient!.delete(
      'links',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
