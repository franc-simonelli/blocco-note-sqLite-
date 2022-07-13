// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:blocconote/provider/noteProvider.dart';
import 'package:blocconote/utils/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../addNote/addNote.screen.dart';

Widget cardWidget(item, context) {
    return Padding(
      key: ValueKey(item),
      padding: EdgeInsets.all(0.0),
      child: Consumer<NoteProvider>(builder: (ctx, provider, _) {
        return GestureDetector(
          onTap: () {
            // Provider.of<NoteProvider>(context, listen: false).notaSelect(item);
            // Navigator.of(context).pushNamed(AddNoteScreen.routeName);
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => AddNoteScreen(item: item),
            ),);
          },
          child: Container(                 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),  
              color: AppTheme.primary,
              boxShadow: AppTheme.shadownCard 
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [ 
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(item.titolo, style: AppTheme.theme.textTheme.titleSmall,))
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(child: Text(item.testo, maxLines: 2,),
                          ),
                        ],
                      ),
            
                    ],
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: () {
                        _showAlertDelete(context, item);
                        // Provider.of<HomeProvider>(context, listen: false).removeNota(item.id);
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade400,
                          shape: BoxShape.circle,
                          boxShadow: AppTheme.shadownCard
                        ),
                        child: Icon(Icons.close, color: Colors.white,),
                      ),
                    ),
                  
                  )
                ]
              ),
            ),
          ),
        );             
      }),
    );
}

Future<void> _showAlertDelete(context, item) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey.shade200,
        title: Text('Attenzione!', style: AppTheme.theme.textTheme.titleSmall),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Sei sicuro di voler eliminare questa nota?'),
           ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Annulla', style: AppTheme.theme.textTheme.labelSmall,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Conferma', style: AppTheme.theme.textTheme.labelSmall),
            onPressed: () {
              Provider.of<NoteProvider>(context, listen: false).deleteNota(item.id);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}