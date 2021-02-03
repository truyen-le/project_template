import 'package:flutter/material.dart';
import 'package:project_template/modules/main_list/models/list_item.dart';

@immutable
abstract class ListEvent {
  const ListEvent();
}

class AddItemEvent extends ListEvent {
  final ListItem item;
  const AddItemEvent({this.item});

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)) return true;
    return other is AddItemEvent && other.item == this.item;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => item.hashCode;
}

class DeleteItemEvent extends ListEvent {
  final ListItem item;
  const DeleteItemEvent({this.item});

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)) return true;
    return other is AddItemEvent && other.item == this.item;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => item.hashCode;
}
