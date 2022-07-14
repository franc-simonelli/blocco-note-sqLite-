import 'package:blocconote/models/lista.model.dart';
import 'package:sqflite/sqflite.dart';

import 'dataRepositoryAttivita.dart';
import 'db.provider.dart';

class AttivitaSqlRepository extends DataRepositoryAttivita {

  DBProvider? _dbp;

  NoteSqlRepository(){
    _dbp = DBProvider.instance;
  }

  @override
  Future<void> closeDB() {
    // TODO: implement closeDB
    throw UnimplementedError();
  }

  @override
  Future<int?> add(Attivita item) async {
    Database? db = await _dbp?.database;
    var id = await db?.insert("Attivita", item.toJson());
    return id;
  }

  @override
  Future<int?> update(Attivita item) async {
    Database? db = await _dbp?.database;
    var id = await db?.update("Attivita", item.toJson(), where: "id = ?", whereArgs: [item.id]);
    return id;
  }

  @override
  Future<bool> delete(int id) async {

    Database? db = await _dbp!.database;
    int count = await db!.delete("Attivita", where: "id = $id");
    return  count == 1;
  }

  Future deleteAll() async {
    try{
      Database? db = await _dbp!.database;
      
      await db!.transaction((txn) async {
        var batch = txn.batch();
        batch.delete('Attivita');
        await batch.commit();
      });
    } catch(error){
      throw Exception('DbBase.cleanDatabase: ' + error.toString());
    }
  }
  

  @override
  Future<List<Attivita>> getAll() async {
    Database? db = await _dbp?.database;

    List<Map<String, dynamic>> data = await db!.query('Attivita');

    List<Attivita> items = data.map<Attivita>((item) {
      return Attivita.fromJson(item);
    }).toList();
    return items;
  }

  @override
  Future<List<Attivita>> getById(int id) async {
    Database? db = await _dbp?.database;

    List<Map<String, dynamic>> data = await db!.query('Attivita', where: 'id = id');
    
    List<Attivita> items = data.map<Attivita>((item) {
      return Attivita.fromJson(item);
    }).toList();
    return items;
  }



}