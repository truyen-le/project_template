import 'package:project_template/modules/main_list/models/list_item.dart';

abstract class ListState {
  List<ListItem> items;
  ListState({this.items});
}

class InitialState extends ListState {
  InitialState({List<ListItem> items}) : super(items: items);

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)) return true;
    return other is InitialState && other.items == this.items;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => items.hashCode;
}

class ProcessingState extends ListState {
  ProcessingState({List<ListItem> items}) : super(items: items);

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)) return true;
    return other is ProcessingState && other.items == this.items;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => items.hashCode;
}

class ProcessedState extends ListState {
  ProcessedState({List<ListItem> items}) : super(items: items);

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (identical(this, other)) return true;
    return other is ProcessedState && other.items == this.items;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => items.hashCode;
}
