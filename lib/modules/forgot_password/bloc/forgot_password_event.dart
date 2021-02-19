part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ResetEmailChanged extends ForgotPasswordEvent {
  const ResetEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SendResetPasswordEmail extends ForgotPasswordEvent {
  const SendResetPasswordEmail();
}
