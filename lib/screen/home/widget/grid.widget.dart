// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:blocconote/provider/noteProvider.dart';
import 'package:blocconote/screen/home/widget/card.widget.dart';
import 'package:blocconote/utils/myTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../../../models/nota.model.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({
    Key? key,
  }) : super(key: key);

  
  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = Provider.of<NoteProvider>(context, listen: false).lista.removeAt(oldIndex);
      Provider.of<NoteProvider>(context, listen: false).lista.insert(newIndex, item);
      Provider.of<NoteProvider>(context, listen: false).changeOrder();
    });
  }


  @override
  Widget build(BuildContext context) {

    return Consumer<NoteProvider>(builder: (ctx, provider, _) {
      return provider.loading
      ?
      Center(
        child: CircularProgressIndicator(),
      )
      :
      provider.lista.length == 0
      ?
      Center(
        child: Text("Non ci sono note"),
      )
      :
      ReorderableGridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        onReorder: _onReorder,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: provider.lista.map((item) {
          return cardWidget(item, context);
        }).toList()
      );
    });
  }

  
}