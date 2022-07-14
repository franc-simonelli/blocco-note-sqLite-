import 'package:blocconote/models/lista.model.dart';
import 'package:blocconote/repository/dataRepositoryAttivita.dart';
import 'package:flutter/cupertino.dart';

import '../repository/attivitaSqlRepository.dart';

class AttivitaProvider extends ChangeNotifier {

  List<Attivita> _listaAttivita = [
    // Lista(id: 1, testo: "Elemento 1", check: true),
    // Lista(id: 2, testo: "Elemento 2", check: false),
    // Lista(id: 3, testo: "Elemento 3", check: true),
    // Lista(id: 4, testo: "Elemento 4", check: false),
    // Lista(id: 5, testo: "Elemento 5", check: true),
    // Lista(id: 6, testo: "Elemento 6", check: false),
    // Lista(id: 7, testo: "Elemento 7", check: true),
    // Lista(id: 8, testo: "Elemento 8", check: false),
    // Lista(id: 9, testo: "Elemento 9", check: true),
    // Lista(id: 10, testo: "Elemento 10", check: false),
  ];
  String _testo = '';
  bool _showAdd = false;
  bool _loading = false;
  late DataRepositoryAttivita _repositoryAttivita;

  String get testo => _testo;
  List get lista => _listaAttivita;
  bool get showAdd => _showAdd;
  bool get loading => _loading;

  Future initRepository() async{
    _repositoryAttivita = AttivitaSqlRepository();
  }

  changeCheck(Attivita item) {
    // _lista.map((e) => e.id == item.id ? e.check = !e.check : null);
    for(var i=0; i<_listaAttivita.length; i++) {
      if(_listaAttivita[i].id == item.id) {
        _listaAttivita[i].check = !_listaAttivita[i].check;
      }
    }
    notifyListeners();
  }

  Future addAttivita() async {
      Attivita newAttivita = Attivita();
      newAttivita.testo = _testo;
      newAttivita.check = false;
      await _repositoryAttivita.add(newAttivita);
      _listaAttivita.add(newAttivita);
      notifyListeners();
  }

  Future deleteNota(id) async {
    await _repositoryAttivita.delete(id);
    _listaAttivita.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  Future updateAttivita(Attivita item) async {
    Attivita updateNota = Attivita();
    updateNota.id = item.id;
    updateNota.testo = _testo;
    await _repositoryAttivita.update(updateNota);
    // for(var i=0; i < _listaNote.length; i++) {
    //   if(_listaNote[i].id == item.id) {
    //     _listaNote[i].titolo = _titolo;
    //     _listaNote[i].testo = _testo;
    //   }
    // }
    getAll();
    // notifyListeners();
  }

  Future getAll() async {
    _loading = true;
    _listaAttivita =  await _repositoryAttivita.getAll();
    _loading = false;
    notifyListeners();
  }

  void testoChanged(String value) {
    _testo = value;
    notifyListeners();
  }

  setShowAdd() {
    _showAdd = true;
    notifyListeners();
  }

  onReorder(oldIndex, newIndex) {
    final item = _listaAttivita.removeAt(oldIndex);
    _listaAttivita.insert(newIndex, item);
    notifyListeners();
  }

  void reset() {
    _testo = '';
  }

}