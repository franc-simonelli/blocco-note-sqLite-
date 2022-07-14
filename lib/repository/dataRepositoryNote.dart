import 'package:blocconote/models/nota.model.dart';

abstract class DataRepositoryNote {
  Future<List<Note>> getAll();
  Future<List<Note>> getById(int id);
  Future<int?> add(Note item);
  Future<int?>update(Note item);
  Future<bool> delete(int id);
  Future deleteAll();
  Future<void> closeDB();
}