import 'package:flutter/material.dart';
import 'package:project_template/widgets/widgets.dart';

import '../home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BrandLogo(),
            HomeList(
              listItems: [
                ItemDetail(
                  title: 'Destination',
                  subtitle: 'Where are you cruising to?',
                  icon: Icons.location_on,
                ),
                ItemDetail(
                  title: 'Departure Port',
                  subtitle: 'Find your nearest port',
                  icon: Icons.directions_boat,
                ),
                ItemDetail(
                  title: 'Sailing months',
                  subtitle: 'Add Dates',
                  icon: Icons.location_on,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: null,
        child: FlutterLogo(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        tabs: {
          'Explore': Icons.explore,
          'Login': Icons.contact_page_outlined,
        },
      ),
    );
  }
}
