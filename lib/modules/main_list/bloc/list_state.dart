part of 'list_bloc.dart';

// ignore: must_be_immutable
abstract class ListState extends Equatable {
  List<ListItem> items;
  ListState({this.items});
}

// ignore: must_be_immutable
class InitialState extends ListState {
  InitialState({List<ListItem> items}) : super(items: items);

  @override
  // TODO: implement props
  List<Object> get props => [items];
}

// ignore: must_be_immutable
class ProcessingState extends ListState {
  ProcessingState({List<ListItem> items}) : super(items: items);

  @override
  // TODO: implement props
  List<Object> get props => [items];

}

// ignore: must_be_immutable
class ProcessedState extends ListState {
  ProcessedState({List<ListItem> items}) : super(items: items);

  @override
  // TODO: implement props
  List<Object> get props => [items];

}
