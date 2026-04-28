import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/anotacao.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, filePath);

  return await openDatabase(
    path,
    version: 2,
    onCreate: _createDB,
    onUpgrade: (db, oldVersion, newVersion) async {
      await db.execute('DROP TABLE IF EXISTS notes');
      await _createDB(db, newVersion);
    },
  );
}

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE notes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      content TEXT NOT NULL,
      date TEXT NOT NULL
    )
  ''');
  }

  Future<int> insertNote(Anotacao note) async {
    final db = await instance.database;

    return await db.insert('notes', {
      'content': note.content,
      'date': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Anotacao>> getAllNotes() async {
    final db = await instance.database;
    final result = await db.query('notes', orderBy: 'date DESC');
    return result.map((json) => Anotacao.fromMap(json)).toList();
  }


  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
