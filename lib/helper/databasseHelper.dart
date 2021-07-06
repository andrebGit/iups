import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sus_plus/dataBase/databaseSql.dart';

class DatabaseHelper {
  String dataName = 'iups1.db';
  static final DatabaseHelper _databaseHelper = DatabaseHelper._internal();
  // instancia privada
  static Database _database;

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  DatabaseHelper._internal();

  //verifica o database para starta
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDatabase();
    }
    return _database;
  }

  //Start database
  Future<Database> initDatabase() async {
    // caminho Path da pasta do dispositivos
    Directory dir = await getApplicationDocumentsDirectory();

    String path = dir.path + dataName;
    // "abrindo o database"

    var iupsDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return iupsDb;
  }

  // criando o banco de dados caso não exista
  void _createDb(Database db, int newVersion) async {
    // executa a criação do database
    DatabaseSql sqlData = DatabaseSql();
    await sqlData.create(db);
    /* List tables = sqlData.getSql();
    tables.forEach((element) async {
      print(element);
      await db.execute(element);
    }); */
  }

  Future<bool> delete() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + dataName;
    databaseFactory.deleteDatabase(path);
    return true;
  }

  Future get db async {
    var x = await this.database;
    return x;
  }

  Future close() async {
    this.db.then((database) {
      Database db = database;
      db.close();
    });
  }

  /* Future openDb() async {
    Database db = await this.database;
    db.isOpen;
  } */
// CRUD create

}
