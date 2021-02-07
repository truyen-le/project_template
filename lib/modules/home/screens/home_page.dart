import 'package:flutter/material.dart';
import 'package:project_template/modules/login/login.dart';
import 'package:project_template/widgets/widgets.dart';

import '../home.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _navigatorKey = GlobalKey<NavigatorState>();
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
        tabs: [
          TabItem(
            title: 'Explore',
            icon: Icons.explore,
            onPressed: () {},
          ),
          TabItem(
              title: 'Login',
              icon: Icons.contact_page_outlined,
              onPressed: () {
                Navigator.of(context).push(LoginPage.route());
              })
        ],
      ),
    );
  }
}
