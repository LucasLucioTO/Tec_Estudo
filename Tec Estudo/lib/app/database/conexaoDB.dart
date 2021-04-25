import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:teste/app/database/script.dart';

class ConexaoDB {
  static Database _db;

  static Future<Database> get() async {
    _db = await _initDb();
    return _db;
  }

  static _initDb() async {
    var path = join(await getDatabasesPath(), 'tec_estudo.db');

    var db = openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static _onCreate(Database db, int version) async {
    await db.execute(createTableAluno);

    await db.execute(insertAluno);

    await db.execute(createTableProfessor);

    await db.execute(insertProfessor);
  }
}
