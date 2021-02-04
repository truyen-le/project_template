import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/modules/main_list/models/list_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(List<ListItem> items)
      : super(ProcessedState(items: items));

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    try {
      if (event is AddItemEvent) {
        yield ProcessingState(items: state.items);
        state.items.add(event.item);
        yield ProcessedState(items: state.items);
      } else if (event is DeleteItemEvent) {
        yield ProcessingState(items: state.items);
        yield ProcessedState(items: state.items);
      }
    } catch (e) {
      addError(Exception('unsupported event'));
    }
  }
}
