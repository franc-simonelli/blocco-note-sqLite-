// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:blocconote/provider/noteProvider.dart';
import 'package:blocconote/screen/addNote/widget/icon.widget.dart';
import 'package:blocconote/utils/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({ Key? key, this.item }) : super(key: key);
  static const String routeName = "/addnota";
  final item;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  final _titoloController = TextEditingController();
  final _testoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if(widget.item != null) {
      _titoloController.text = widget.item.titolo!;
      _testoController.text = widget.item.testo!;
    } 
    // _titoloController.text = 'TITOLO';
    // _testoController.text = 'TESTO';
  }


  

  @override
  Widget build(BuildContext context) {
    // Provider.of<NoteProvider>(context, listen: false).resetIsAdd();
    // if(Provider.of<NoteProvider>(context, listen: false).notaSelezionata.id != null) {
    //   _titoloController.text =  Provider.of<NoteProvider>(context, listen: false).notaSelezionata.titolo!;
    //   _testoController.text = Provider.of<NoteProvider>(context, listen: false).notaSelezionata.testo!;
    // }
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 70,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconWidget(_formKey, widget.item),
            ),
      
            SizedBox(height: 20,),
            formTitoloWidget(context),
            // SizedBox(height: 10,),
            formTestoWidget(context),
          ],
        ),
      ),
    );
  }

  TextFormField formTestoWidget(BuildContext context) {
    return TextFormField(
      controller: _testoController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: TextStyle(color: Colors.black, fontSize: 16),
      cursorColor: Colors.orange,
      cursorHeight: 30,
      cursorWidth: 2,    
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
        hintText: "Digita testo",
        fillColor: Colors.transparent,
        filled: true,          
      ),
      onChanged: (value) {
        Provider.of<NoteProvider>(context, listen: false).testoChanged(value);
      },
      onSaved: (value) {
        Provider.of<NoteProvider>(context, listen: false).testoChanged(value ?? "");
      },
    );
  }

  TextFormField formTitoloWidget(BuildContext context) {
    return TextFormField(
      controller: _titoloController,
      style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      cursorColor: Colors.orange,
      cursorHeight: 30,
      cursorWidth: 2,    
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 22, fontWeight: FontWeight.bold),
        hintText: "Titolo",
        fillColor: Colors.transparent,
        filled: true,          
      ),
      onChanged: (value) {
        Provider.of<NoteProvider>(context, listen: false).titoloChanged(value);
      },
      onSaved: (value) {
        Provider.of<NoteProvider>(context, listen: false).titoloChanged(value ?? "");
      },
    );
  }
}

