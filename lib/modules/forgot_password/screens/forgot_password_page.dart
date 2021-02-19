import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:project_template/core/authentication/authentication.dart';
import 'package:project_template/modules/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:project_template/widgets/input_text_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ForgotPasswordPage());
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) => ForgotPasswordBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: maxHeight * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _ResetInstruction(
                parentsMaxHeight: maxHeight,
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: maxHeight * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _ResetEmailInput(),
              SizedBox(
                height: maxHeight * 0.02,
              ),
              _SendResetInstructionButton(
                parentsMaxHeight: maxHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ResetInstruction extends StatelessWidget {
  const _ResetInstruction({this.parentsMaxHeight});

  final double parentsMaxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: parentsMaxHeight * 0.03,
        ),
        Text(
          'Enter the email address you used when you joined and we\'ll send you instructions to reset your password.',
          style: TextStyle(
            fontSize: parentsMaxHeight * 0.02,
          ),
        ),
        SizedBox(
          height: parentsMaxHeight * 0.03,
        ),
        Text(
          'For security reasons, we do NOT store your password. So rest assured that we well never send your password via email.',
          style: TextStyle(
            fontSize: parentsMaxHeight * 0.02,
          ),
        ),
        SizedBox(
          height: parentsMaxHeight * 0.03,
        ),
      ],
    );
  }
}

class _ResetEmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => InputTextForm(
        prefixIcon: Icons.email_outlined,
        isObscureText: false,
        keyboardType: TextInputType.emailAddress,
        onChanged: (email) =>
            context.read<ForgotPasswordBloc>().add(ResetEmailChanged(email)),
      ),
    );
  }
}

class _SendResetInstructionButton extends StatelessWidget {
  const _SendResetInstructionButton({this.parentsMaxHeight});

  final double parentsMaxHeight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 45,
        width: double.infinity,
        child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) => state.status.isSubmissionInProgress
              ? Center(child: CircularProgressIndicator())
              : RaisedButton(
                  color: Colors.blue,
                  onPressed: state.status.isValidated
                      ? () => context
                          .read<ForgotPasswordBloc>()
                          .add(SendResetPasswordEmail())
                      : null,
                  child: Text(
                    'Send Reset Instruction',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: parentsMaxHeight * 0.02,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
