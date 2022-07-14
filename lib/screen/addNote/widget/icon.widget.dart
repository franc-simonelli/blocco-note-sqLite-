import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../../provider/attivitaProvider.dart';
import '../../../provider/noteProvider.dart';
import '../../../utils/myTheme.dart';

class IconWidget extends StatelessWidget {
  IconWidget(GlobalKey<FormState> this.formKey, this.item, this.sezione, {
    Key? key,
  }) : super(key: key);

  final formKey;
  final item;
  final sezione;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NeumorphicButton(
          onPressed: () {
            sezione == 'note' ? Provider.of<NoteProvider>(context, listen: false).reset() : Provider.of<AttivitaProvider>(context, listen: false).reset();
            Navigator.of(context).pop();
          },
          style: NeumorphicStyle(
            depth: 2,
            intensity: 0.8,
            shadowDarkColor: Colors.grey.shade800,
            shadowLightColor: Colors.white,
            color: AppTheme.primary,
            // shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          // padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.arrow_back)
        ),
        NeumorphicButton(
          onPressed: () async {
            formKey.currentState!.save();   
            if(sezione == 'note') {
              if(item != null) {
                await Provider.of<NoteProvider>(context, listen: false).updateNote(item);
              }else {
                await Provider.of<NoteProvider>(context, listen: false).addNota();
              }   
            }else {
              if(item != null) {
                await Provider.of<AttivitaProvider>(context, listen: false).updateAttivita(item);
              }else {
                await Provider.of<AttivitaProvider>(context, listen: false).addAttivita();
              }   
            }
             
            
            Navigator.of(context).pop();
          },
          style: NeumorphicStyle(
            depth: 2,
            intensity: 0.8,
            shadowDarkColor: Colors.grey.shade800,
            shadowLightColor: Colors.white,
            color: AppTheme.primary,
            // shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          // padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.check)
        ),
      ],
    );
  }
}