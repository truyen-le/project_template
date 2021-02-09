import 'package:flutter/material.dart';

class SignUpBrandLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.15;
    return Container(
      height: maxHeight,
      child: Center(
        child: Column(
          children: [
            FlutterLogo(
              size: maxHeight * 0.7,
            ),
            FittedBox(
              child: Text(
                'Sign up to Booking Template',
                style: TextStyle(
                  fontSize: maxHeight * 0.25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
