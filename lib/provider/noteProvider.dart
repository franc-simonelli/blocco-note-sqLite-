// ignore_for_file: prefer_final_fields

import 'package:blocconote/repository/data.repository.note.dart';
import 'package:blocconote/repository/note.sql.repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../models/nota.model.dart';

class NoteProvider extends ChangeNotifier {
  // final List _listaNote = [
  //   Note(id: 1, titolo: 'Titolo 1', testo: 'Prova testo Prova testo Prova testo Prova testoProva testo Prova testo Prova testo Prova testo Prova testo Prova testo Prova testo Prova testo'),
  //   Note(id: 2, titolo: 'Titolo 2', testo: 'Prova testo'),
  //   Note(id: 3, titolo: 'Titolo 3', testo: 'Prova testo Prova testo Prova testo Prova testoProva testo Prova testo Prova testo Prova testo Prova testo Prova testo Prova testo Prova testo'),
  //   Note(id: 4, titolo: 'Titolo 4', testo: 'Prova testo'),
  //   Note(id: 5, titolo: 'Titolo 5', testo: 'Prova testo Prova testo Prova testo Prova testoProva testo Prova testo Prova testo Prova testo Prova testo Prova testo Prova testo Prova testo'),
  //   Note(id: 6, titolo: 'Titolo 6', testo: 'Prova testo'),
  // ];

  List<Note> _listaNote = [];
  
  late DataRepositoryNote _repositoryNote;
  String _titolo = '';
  String _testo = '';
  Note _notaSelect = Note();
  bool _loading = false;

  List get lista => _listaNote;
  Note get notaSelezionata => _notaSelect;
  String get titolo => _titolo;
  String get testo => _testo;
  bool get loading => _loading;


  Future initRepository() async{
    _repositoryNote = NoteSqlRepository();
  }


  Future prova(item, newIndex) async{
    await _repositoryNote.delete(item.id);
    item.id = newIndex;
    await _repositoryNote.add(item);
  }

  Future getAll() async {
    _loading = true;
    _listaNote = await _repositoryNote.getAll();
    _loading = false;
    notifyListeners();
  }

  Future addNota() async {
      Note newNota = Note();
      newNota.titolo = _titolo;
      newNota.testo = _testo;
      await _repositoryNote.add(newNota);
      _listaNote.add(newNota);
      notifyListeners();
  }

  Future deleteNota(id) async {
    await _repositoryNote.delete(id);
    _listaNote.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  Future updateNote(Note item) async {
    Note updateNota = Note();
    updateNota.id = item.id;
    updateNota.titolo = _titolo;
    updateNota.testo = _testo;
    await _repositoryNote.update(updateNota);
    // for(var i=0; i < _listaNote.length; i++) {
    //   if(_listaNote[i].id == item.id) {
    //     _listaNote[i].titolo = _titolo;
    //     _listaNote[i].testo = _testo;
    //   }
    // }
    getAll();
    // notifyListeners();
  }

  Future changeOrder() async {
    print(_listaNote[0].titolo);
    await _repositoryNote.deleteAll();
    for(var i=0; i<_listaNote.length; i++) {
      _listaNote[i].id = null;
      await _repositoryNote.add(_listaNote[i]);
    }
    // _listaNote.forEach((element) async {
    //   await _repositoryNote.add(element);
    // });
    getAll();
  }

  void titoloChanged(String value) {
    _titolo = value; 
    notifyListeners();
  }

  void testoChanged(String value) {
    _testo = value;
    notifyListeners();
  }

  void reset() {
    _titolo = '';
    _testo = '';
  }

}