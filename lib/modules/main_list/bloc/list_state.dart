part of 'list_bloc.dart';

// ignore: must_be_immutable
class ListState extends Equatable {

  const ListState._({this.items});

  const ListState.processing({this.items});

  const ListState.processed({this.items});

  final List<ListItem> items;

  @override
  // TODO: implement props
  List<Object> get props => [items];
}
