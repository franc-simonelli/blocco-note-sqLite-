import 'package:blocconote/models/lista.model.dart';

abstract class DataRepositoryAttivita {
  Future<List<Attivita>> getAll();
  Future<List<Attivita>> getById(int id);
  Future<int?> add(Attivita item);
  Future<int?>update(Attivita item);
  Future<bool> delete(int id);
  Future deleteAll();
  Future<void> closeDB();
}