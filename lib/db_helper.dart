import 'package:path/path.dart';
import 'package:praktikum_7/perpustakaan_list_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:praktikum_7/perpustakaan.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  // ignore: unused_field
  static late Database _database;

  Future<Database> get database async {
    return _database = await _initializeDb();
  }

  static const String _tableName = 'perpustakaans';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'perpustakaan_db.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, nama TEXT, email TEXT, alamat TEXT, nohp TEXT)''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertPerpustakaan(Perpustakaan perpustakaan) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      perpustakaan.toMap(),
    );
  }

  Future<List<Perpustakaan>> getPerpustakaans() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);

    return result.map((res) => Perpustakaan.fromMap(res)).toList();
  }

  Future<int> deletePerpustakaan(int id) async {
    final Database db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updatePerpustakaan(Perpustakaan perpustakaan) async {
    final Database db = await database;
    return await db.update(_tableName, perpustakaan.toMap(),
        where: 'id = ?', whereArgs: [perpustakaan.id]);
  }
}