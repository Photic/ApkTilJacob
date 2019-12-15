import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

// Generate jsonBuilder -> flutter packages pub run build_runner build

// Conflicts -> flutter packages pub run build_runner build --delete-conflicting-outputs

class SQLiteControl {
  Database _database;

  SQLiteControl();

  final String notesGridItemTable = 'mainGridItem';
  final String notesListItemTable = 'notesListItem';
  final String id = 'id';
  final String text = 'text';
  final String color = 'color';
  final String image = 'image';
  final String radio = 'radio';
  final String primaryKey = 'primaryKey';

  void databaseLog(String functionName, String sql, [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult]) {
    print(functionName);
    print(sql);

    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createGridNotesTable(Database db) async {
    final gridTable = '''CREATE TABLE IF NOT EXISTS $notesGridItemTable
    (
      $id INTEGER PRIMARY KEY AUTOINCREMENT,
      $text TEXT,
      $color TEXT,
      $image TEXT
    );''';

    await db.execute(gridTable);
  }

  Future<void> createItemNotesTable(Database db) async {
    final notesItemsTable = '''CREATE TABLE IF NOT EXISTS $notesListItemTable
    (
      $id INTEGER,
      $text TEXT,
      $radio INTEGER,
      $primaryKey INTEGER PRIMARY KEY AUTOINCREMENT
    )
    ''';

    await db.execute(notesItemsTable);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  /// Build the db to Documents folder.
  Future<Database> _initDB() async {
    final path = await this.getDatabasePath('secure_local_db.db');
    final database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await createGridNotesTable(db);
    await createItemNotesTable(db);
  }

  /// Getter for singleton database impl.
  Future<Database> get database async {
    if (_database == null) _database = await _initDB();
    return _database;
  }
}
