part of 'explore_bloc.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ExplorePageChanged extends ExploreEvent {
  const ExplorePageChanged(this.page);

  final int page;

  @override
  // TODO: implement props
  List<Object> get props => [this.page];
}
