import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/modules/login/bloc/login_bloc.dart';
import 'package:project_template/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email'),
          _UsernameInput(),
          SizedBox(
            height: maxHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Password'),
              Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account? '),
              Text(
                'Sign up now',
                style: TextStyle(color: Colors.blue),
              )
            ],
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
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) => InputTextForm(
        prefixIcon: Icons.email_outlined,
        isObscureText: false,
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
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {},
          child: Text(
            'Sign in',
            style: TextStyle(color: Colors.white),
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
