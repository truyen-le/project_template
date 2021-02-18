import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/core/authentication/authentication.dart';
import 'package:project_template/modules/sign_up/bloc/sign_up_bloc.dart';
import 'package:project_template/modules/sign_up/screens/screens.dart';

class SignUpPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) => SignUpBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
          ),
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listenWhen: (previousState, currentState) =>
                previousState.status != currentState.status,
            listener: (context, state) {
              if (state.status == AuthenticationStatus.authenticated) {
                Navigator.of(context).pop();
              }
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SignUpBrandLogo(),
                  SizedBox(
                    height: maxHeight * 0.075,
                  ),
                  SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
