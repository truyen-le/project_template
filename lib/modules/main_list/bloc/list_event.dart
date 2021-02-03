part of 'list_bloc.dart';

@immutable
abstract class ListEvent extends Equatable {
  const ListEvent();
}

class AddItemEvent extends ListEvent {
  final ListItem item;
  const AddItemEvent({this.item});

  @override
  // TODO: implement props
  List<Object> get props => [item];
}

class DeleteItemEvent extends ListEvent {
  final ListItem item;
  const DeleteItemEvent({this.item});

  @override
  // TODO: implement props
  List<Object> get props => [item];
}
