import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:project_template/modules/forgot_password/forgot_password.dart';
import 'package:project_template/modules/login/bloc/login_bloc.dart';
import 'package:project_template/modules/sign_up/screens/screens.dart';
import 'package:project_template/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _EmailInput(),
            SizedBox(
              height: maxHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Forgot Password?',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(ForgotPasswordPage.route());
                      },
                  ),
                ),
              ],
            ),
            _PasswordInput(),
            SizedBox(
              height: maxHeight * 0.04,
            ),
            _SignInButton(),
            SizedBox(
              height: maxHeight * 0.04,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(text: 'Don\'t have an account? '),
                    TextSpan(
                      text: 'Sign up now.',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context)
                              .pushReplacement(SignUpPage.route());
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: maxHeight * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                      'Or',
                      textAlign: TextAlign.center,
                    )),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: maxHeight * 0.04,
            ),
            _SignInWithGoogleButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => InputTextForm(
        prefixIcon: Icons.email_outlined,
        isObscureText: false,
        keyboardType: TextInputType.emailAddress,
        onChanged: (email) =>
            context.read<LoginBloc>().add(LoginEmailChanged(email)),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => InputTextForm(
        prefixIcon: Icons.lock_outline_rounded,
        isObscureText: true,
        keyboardType: TextInputType.visiblePassword,
        onChanged: (password) =>
            context.read<LoginBloc>().add(LoginPasswordChanged(password)),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 45,
        width: double.infinity,
        child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) => state.status.isSubmissionInProgress
              ? Center(child: CircularProgressIndicator())
              : RaisedButton(
                  color: Colors.blue,
                  onPressed: state.status.isValidated
                      ? () =>
                          context.read<LoginBloc>().add(LoginWithCredentials())
                      : null,
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
        ),
      ),
    );
  }
}

class _SignInWithGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(EvaIcons.googleOutline),
            Text(
              ' Sign in with Google',
            ),
          ],
        ),
      ),
    );
  }
}
