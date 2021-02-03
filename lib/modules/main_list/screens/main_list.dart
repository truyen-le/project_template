import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/modules/main_list/bloc/list_bloc.dart';
import 'package:project_template/modules/main_list/bloc/list_event.dart';
import 'package:project_template/modules/main_list/bloc/list_state.dart';
import 'package:project_template/modules/main_list/models/list_item.dart';

class MainList extends StatefulWidget {
  @override
  _MainListState createState() => _MainListState();
}

class _MainListState extends State<MainList> {

  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteListBloc([ListItem(note: 'Item ' + _count.toString())]),
      child: BlocBuilder<NoteListBloc, ListState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return Text(state.items[index].note);
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()  {
                _count++;
                context.read<NoteListBloc>().add(
                AddItemEvent(
                  item: ListItem(note: 'Item ' + _count.toString()),
                ),
              );},
              tooltip: 'Add Note',
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
