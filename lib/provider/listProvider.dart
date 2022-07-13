import 'package:blocconote/models/lista.model.dart';
import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier {

  final List<Lista> _lista = [
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

  List get lista => _lista;

  changeCheck(Lista item) {
    // _lista.map((e) => e.id == item.id ? e.check = !e.check : null);
    for(var i=0; i<_lista.length; i++) {
      if(_lista[i].id == item.id) {
        _lista[i].check = !_lista[i].check;
      }
    }
    notifyListeners();
  }

  onReorder(oldIndex, newIndex) {
    final item = _lista.removeAt(oldIndex);
    _lista.insert(newIndex, item);
    notifyListeners();
  }

}