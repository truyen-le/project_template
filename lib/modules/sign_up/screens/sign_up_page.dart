import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    );
  }
}
