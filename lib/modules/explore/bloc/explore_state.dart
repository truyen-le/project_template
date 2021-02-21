part of 'explore_bloc.dart';

class ExploreState extends Equatable {
  const ExploreState({
    this.currentPage = 0,
  });

  final int currentPage;

  ExploreState copyWith({
    int currentPage,
  }) {
    return ExploreState(currentPage: currentPage ?? this.currentPage);
  }

  @override
  // TODO: implement props
  List<Object> get props => [this.currentPage];
}
