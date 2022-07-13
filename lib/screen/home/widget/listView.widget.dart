
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blocconote/models/lista.model.dart';
import 'package:blocconote/screen/home/widget/tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/listProvider.dart';
import '../../../utils/myTheme.dart';

class ListViewWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(builder: (ctx, provider, _) {
      return provider.lista.length == 0
      ?
      Center(child: Text("Non ci sono note"),)
      :
      ReorderableListView.builder(
        itemCount: provider.lista.length,
        itemBuilder: (BuildContext context, int index) { 
          final item = provider.lista[index];
          return listTileWidget(item, index, context);
        }, 
        onReorder:(oldIndex, newIndex) {
          Provider.of<ListProvider>(context, listen: false).onReorder(oldIndex, newIndex);
        } 
        
      );
    });
  }

  
}
