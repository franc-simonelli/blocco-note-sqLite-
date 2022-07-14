
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:blocconote/models/lista.model.dart';
import 'package:blocconote/screen/home/widget/tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/attivitaProvider.dart';
import '../../../utils/myTheme.dart';

class ListViewWidget extends StatelessWidget {
  
  ListViewWidget(this.keyBoard);

  final keyBoard;

  @override
  Widget build(BuildContext context) {

    

    return Consumer<AttivitaProvider>(builder: (ctx, provider, _) {
      return provider.lista.length == 0
      ?
      Center(child: Text("Non ci sono attività"),)
      :
      ReorderableListView.builder(
        shrinkWrap: true,
        itemCount: provider.lista.length,
        itemBuilder: (BuildContext context, int index) { 
          final item = provider.lista[index];
          return listTileWidget(item, index, context);
        }, 
        onReorder:(oldIndex, newIndex) {
          Provider.of<AttivitaProvider>(context, listen: false).onReorder(oldIndex, newIndex);
        } 
        
      );
    });
  }

  // Widget SearchWidget(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       height: 100,
  //       decoration: BoxDecoration(
  //         color: Colors.red,
  //         borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
  //       ),
  //       child: TextField(
  //         decoration: InputDecoration(
  //           suffixIcon: Icon(Icons.search, color: Colors.grey,),
  //           contentPadding: EdgeInsets.all(15),
  //           hintText: 'Name a Cocktail?',
  //           border: InputBorder.none,
  //           focusedBorder: InputBorder.none,
  //           enabledBorder: InputBorder.none,
  //           errorBorder: InputBorder.none,
  //           disabledBorder: InputBorder.none,
  //         ),
  //       ),
  //     ),
  //   );
  // }  
}
