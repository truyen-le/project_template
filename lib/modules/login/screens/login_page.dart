import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/core/authentication/authentication.dart';
import 'package:project_template/modules/login/bloc/login_bloc.dart';

import 'login_brand_logo.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) => LoginBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginBrandLogo(),
              SizedBox(
                height: maxHeight * 0.075,
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
