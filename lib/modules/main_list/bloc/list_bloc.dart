import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/modules/main_list/main_list.dart';
import 'package:project_template/modules/main_list/models/list_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(List<ListItem> items)
      : super(ListState.processed(items: items));

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    try {
      if (event is AddItemEvent) {
        yield ListState.processing(items: state.items);
        state.items.add(event.item);
        yield ListState.processed(items: state.items);
      } else if (event is DeleteItemEvent) {
        yield ListState.processing(items: state.items);
        yield ListState.processed(items: state.items);
      }
    } catch (e) {
      addError(Exception('unsupported event'));
    }
  }
}
