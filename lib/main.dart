// ignore_for_file: prefer_const_constructors

import 'package:blocconote/provider/listProvider.dart';
import 'package:blocconote/provider/noteProvider.dart';
import 'package:blocconote/screen/addNote/addNote.screen.dart';
import 'package:blocconote/screen/home/homePageScreen.dart';
import 'package:blocconote/utils/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:provider/provider.dart';


void main() {
  ModuleContainer().initialise(Injector());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteProvider()),
        ChangeNotifierProvider(create: (_) => ListProvider()),
      ],
      child: MyApp(),
    )
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Provider.of<NoteProvider>(context, listen: false).initRepository();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: createRoutes(),
      theme: AppTheme.theme,
      // darkTheme: AppTheme.darkTheme,
      home: HomePageScreen(),
    );
  }
}

class ModuleContainer {
  Injector initialise(Injector injector) {
    
    return injector;
  }
}

Map<String, Widget Function(BuildContext)> createRoutes() {
  return {
    AddNoteScreen.routeName: (ctx) => AddNoteScreen(),
  };
}


