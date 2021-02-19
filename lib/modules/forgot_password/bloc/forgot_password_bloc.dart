import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:project_template/core/authentication/authentication.dart';
import 'package:project_template/modules/forgot_password/model/models.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const ForgotPasswordState());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ResetEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is SendResetPasswordEmail) {
      yield* _mapSendResetPasswordEmailToState(event, state);
    }
  }

  ForgotPasswordState _mapEmailChangedToState(
    ResetEmailChanged event,
    ForgotPasswordState state,
  ) {
    final email = Email.dirty(event.email);
    return state.copyWith(
      email: email,
      status: Formz.validate([email]),
    );
  }

  Stream<ForgotPasswordState> _mapSendResetPasswordEmailToState(
    SendResetPasswordEmail event,
    ForgotPasswordState state,
  ) async* {
    if (!state.status.isValidated) return;
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      await _authenticationRepository.sendPasswordResetEmail(
        email: state.email.value,
      );
      yield state.copyWith(status: FormzStatus.submissionSuccess);
    } on Exception {
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }
}
