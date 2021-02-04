import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/modules/main_list/main_list.dart';

class MainListPage extends StatefulWidget {
  @override
  _MainListPageState createState() => _MainListPageState();
}

class _MainListPageState extends State<MainListPage> {

  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBloc([ListItem(note: 'Item ' + _count.toString())]),
      child: BlocBuilder<ListBloc, ListState>(
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
                context.read<ListBloc>().add(
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
