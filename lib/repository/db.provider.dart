// ignore: file_names
// ignore_for_file: avoid_init_to_null, file_names

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider instance = DBProvider._();

  static Database? _database = null;

  Future<Database?> get database async {
    if(_database != null) {
      return _database;
    }
    else {
      _database = await _initDB();
      return _database;
    }
  }

  Future _initDB() async {
    // count the number of scripts to define the version of the database
    Directory? documentsDirectory = await getExternalStorageDirectory();
    String path = join(documentsDirectory!.path, "databaseBloccoNote.db");

    int nbrMigrationScripts = migrationScripts.length;
    var db = await openDatabase(
      path,
      version: nbrMigrationScripts,
      // if the database does not exist, onCreate executes all the sql requests of the "migrationScripts" map
      onCreate: (Database db, int version) async {
        for (int i = 1; i <= nbrMigrationScripts; i++) {
          
          await _executeMigrations(migrationScripts[i] as List<String>, db);
        }
      },
      /// if the database exists but the version of the database is different 
      /// from the version defined in parameter, onUpgrade will execute all sql requests greater than the old version
      onUpgrade: (db, oldVersion, newVersion) async {
        for (int i = oldVersion + 1; i <= newVersion; i++) {
          await _executeMigrations(migrationScripts[i] as List<String>, db);
        }
      },
    );
    return db;
  }

  Future<void> _executeMigrations(List<String> queries, Database db) async{
    for (var query in queries) {
      await db.execute(query);
    }
  }

  Map<int, List<String>> migrationScripts = {
    1: 
      [
        "CREATE TABLE Note (id INTEGER PRIMARY KEY AUTOINCREMENT, titolo, testo)",
        // "CREATE TABLE Lista (id INTEGER PRIMARY KEY AUTOINCREMENT, testo, check)",
      ],
    
  };

  Future<void> close() async {
    if(_database != null ) return _database!.close();
    return null;
  }

  
}