part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.termsConfirmed = const TermsConfirmed.pure(),
    this.status = FormzStatus.pure,
  });

  final Name name;
  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final TermsConfirmed termsConfirmed;
  final FormzStatus status;

  @override
  List<Object> get props =>
      [email, password, confirmedPassword, termsConfirmed, status];

  SignUpState copyWith({
    Name name,
    Email email,
    Password password,
    ConfirmedPassword confirmedPassword,
    TermsConfirmed termsConfirmed,
    FormzStatus status,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      termsConfirmed: termsConfirmed ?? this.termsConfirmed,
      status: status ?? this.status,
    );
  }
}
