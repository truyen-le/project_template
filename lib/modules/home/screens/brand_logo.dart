import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.20;
    return Container(
      height: maxHeight,
      child: Center(
        child: Column(
          children: [
            FlutterLogo(
              size: maxHeight * 0.7,
            ),
            Text(
              'Flutter Template',
              style: TextStyle(
                fontSize: maxHeight * 0.25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
