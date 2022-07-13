// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/lista.model.dart';
import '../../../provider/listProvider.dart';
import '../../../utils/myTheme.dart';

Widget listTileWidget(Lista item, int index, BuildContext context) {
    return Padding(
      key: Key(index.toString()),
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.white),
          color: AppTheme.primary,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(-3, -3),
              color: Colors.white
            ),
            BoxShadow(
              blurRadius: 5,
              offset: Offset(5, 5),
              color: Color(0xFFA7A9AF)
            )
          ]
          // boxShadow: AppTheme.shadownCard 
        ),                
        child: ListTile(
          leading: item.check
            ? 
            GestureDetector(
              onTap: () {Provider.of<ListProvider>(context, listen: false).changeCheck(item);},
              child: Icon(Icons.check_box, color: Colors.orange,)
            )
            : 
            GestureDetector(
              onTap: () {Provider.of<ListProvider>(context, listen: false).changeCheck(item);},
              child: Icon(Icons.check_box_outline_blank)
            ),

          title: item.check 
            ?
            Text(item.testo!, style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey))
            :
            Text(item.testo!),
        ),
      ),
    );
  }