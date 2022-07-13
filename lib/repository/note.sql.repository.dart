// ignore_for_file: override_on_non_overriding_member, unused_field, file_names
import 'package:blocconote/models/nota.model.dart';
import 'package:blocconote/repository/data.repository.note.dart';
import 'package:blocconote/repository/db.provider.dart';
import 'package:sqflite/sqflite.dart';

class NoteSqlRepository extends DataRepositoryNote {

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
  Future<int?> add(Note item) async {
    Database? db = await _dbp?.database;
    var id = await db?.insert("Note", item.toJson());
    return id;
  }

  @override
  Future<int?> update(Note item) async {
    Database? db = await _dbp?.database;
    var id = await db?.update("Note", item.toJson(), where: "id = ?", whereArgs: [item.id]);
    return id;
  }

  @override
  Future<bool> delete(int id) async {

    Database? db = await _dbp!.database;
    int count = await db!.delete("Note", where: "id = $id");
    return  count == 1;
  }

  Future deleteAll() async {
    try{
      Database? db = await _dbp!.database;
      
      await db!.transaction((txn) async {
        var batch = txn.batch();
        batch.delete('Note');
        await batch.commit();
      });
    } catch(error){
      throw Exception('DbBase.cleanDatabase: ' + error.toString());
    }
  }
  

  @override
  Future<List<Note>> getAll() async {
    Database? db = await _dbp?.database;

    List<Map<String, dynamic>> data = await db!.query('Note');

    List<Note> items = data.map<Note>((item) {
      return Note.fromJson(item);
    }).toList();
    return items;
  }

  @override
  Future<List<Note>> getById(int id) async {
    Database? db = await _dbp?.database;

    List<Map<String, dynamic>> data = await db!.query('Note', where: 'id = id');
    
    List<Note> items = data.map<Note>((item) {
      return Note.fromJson(item);
    }).toList();
    return items;
  }



}