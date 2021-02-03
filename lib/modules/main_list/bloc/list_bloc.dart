import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/modules/main_list/bloc/list_event.dart';
import 'package:project_template/modules/main_list/bloc/list_state.dart';
import 'package:project_template/modules/main_list/models/list_item.dart';

class NoteListBloc extends Bloc<ListEvent, ListState> {
  NoteListBloc(List<ListItem> items)
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
