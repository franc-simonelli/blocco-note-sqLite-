// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, equal_keys_in_map

import 'package:blocconote/models/nota.model.dart';
import 'package:blocconote/provider/listProvider.dart';
import 'package:blocconote/provider/noteProvider.dart';
import 'package:blocconote/screen/addNote/addNote.screen.dart';
import 'package:blocconote/screen/home/widget/grid.widget.dart';
import 'package:blocconote/screen/home/widget/listView.widget.dart';
import 'package:blocconote/utils/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({ Key? key }) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> with SingleTickerProviderStateMixin{
  
  late TabController _tabController = new TabController(initialIndex: 0, length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {

    Provider.of<NoteProvider>(context, listen: false).getAll();
    
    return Scaffold(
      body: Column( 
        children: [
          SizedBox(height: 70,),
          TabBar( 
            padding: EdgeInsets.only(left: 120, right: 120),
            indicatorColor: Colors.transparent,
            unselectedLabelColor: AppTheme.grey,
            labelColor: AppTheme.orange,
            tabs: [
              Tab(icon: Icon(Icons.book)),
              Tab(icon: Icon(Icons.list_alt)),
            ],
            controller: _tabController,
          ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      GridViewScreen(),
                      SizedBox(height: 70,)
                    ],
                  ),
                ),
                ListViewWidget()
              ],
              controller: _tabController,
            ),
          ),
      
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: AppTheme.primary,),
        onPressed: (){
          Navigator.of(context).pushNamed(AddNoteScreen.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


