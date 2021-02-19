import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:project_template/core/authentication/repositories/authentication_repository.dart';
import 'package:project_template/modules/sign_up/models/models.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpNameChanged) {
      yield _mapNameChangedToState(event, state);
    } else if (event is SignUpEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is SignUpPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is SignUpTermsConfirmedChanged) {
      yield _mapTermsConfirmedChangedToState(event, state);
    } else if (event is SignUpWithEmailAndPassword) {
      yield* _mapLoginWithCredentialsToState(event, state);
    }
  }

  SignUpState _mapNameChangedToState(
    SignUpNameChanged event,
    SignUpState state,
  ) {
    final name = Name.dirty(event.name);
    return state.copyWith(
      name: name,
      status: Formz.validate(
          [name, state.email, state.password, state.termsConfirmed]),
    );
  }

  SignUpState _mapEmailChangedToState(
    SignUpEmailChanged event,
    SignUpState state,
  ) {
    final email = Email.dirty(event.email);
    return state.copyWith(
      email: email,
      status: Formz.validate(
          [state.name, email, state.password, state.termsConfirmed]),
    );
  }

  SignUpState _mapPasswordChangedToState(
    SignUpPasswordChanged event,
    SignUpState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate(
          [state.name, state.email, password, state.termsConfirmed]),
    );
  }

  SignUpState _mapTermsConfirmedChangedToState(
    SignUpTermsConfirmedChanged event,
    SignUpState state,
  ) {
    final termsConfirmed = TermsConfirmed.dirty(event.termsConfirmed);
    return state.copyWith(
      termsConfirmed: termsConfirmed,
      status: Formz.validate(
          [state.name, state.email, state.password, termsConfirmed]),
    );
  }

  Stream<SignUpState> _mapLoginWithCredentialsToState(
    SignUpWithEmailAndPassword event,
    SignUpState state,
  ) async* {
    if (!state.status.isValidated) return;
    yield state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      await _authenticationRepository.signUp(
        name: state.name.value,
        email: state.email.value,
        password: state.password.value,
      );
      yield state.copyWith(status: FormzStatus.submissionSuccess);
    } on Exception {
      yield state.copyWith(status: FormzStatus.submissionFailure);
    }
  }
}
