import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(const ExploreState());

  @override
  Stream<ExploreState> mapEventToState(ExploreEvent event) async* {
    // TODO: implement mapEventToState
    if (event is ExplorePageChanged) {
      yield _mapPageChangedToState(event, state);
      print(state.currentPage);
    }
  }

  ExploreState _mapPageChangedToState(
    ExplorePageChanged event,
    ExploreState state,
  ) {
    return state.copyWith(
      currentPage: event.page,
    );
  }
}
