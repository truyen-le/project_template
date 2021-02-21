import 'package:flutter/material.dart';

class ExploreGeneralInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Text(
            'Explore',
            style: TextStyle(
              color: Colors.blue,
              fontSize: maxHeight * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            'Destinations',
            style: TextStyle(
              fontSize: maxHeight * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: maxHeight * 0.025,
        ),
        FittedBox(
          child: Text(
            'From all your favorite Cruise lines',
            style: TextStyle(
              fontSize: maxHeight * 0.025,
            ),
          ),
        ),
        SizedBox(
          height: maxHeight * 0.085,
        ),
        Flexible(
          child: _InfoGridView(
            parentMaxWidth: maxWidth,
          ),
        ),
      ],
    );
  }
}

class _InfoGridView extends StatelessWidget {
  const _InfoGridView({this.parentMaxWidth});

  final parentMaxWidth;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.8,
      shrinkWrap: true,
      children: [
        InkWell(
          onTap: () {
            print('Tap');
          },
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: FlutterLogo(),
            ),
          ),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: FlutterLogo(),
          ),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: FlutterLogo(),
          ),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: FlutterLogo(),
          ),
        ),
      ],
    );
  }
}
