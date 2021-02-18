import 'package:formz/formz.dart';

enum TermsValidationError { invalid }

class TermsConfirmed extends FormzInput<bool, TermsValidationError> {
  const TermsConfirmed.pure() : super.pure(false);
  const TermsConfirmed.dirty([bool value = false]) : super.dirty(value);

  @override
  TermsValidationError validator(bool value) {
    return value ? null : TermsValidationError.invalid;
  }
}
