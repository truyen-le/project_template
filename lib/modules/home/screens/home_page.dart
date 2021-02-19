import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/core/authentication/authentication.dart';
import 'package:project_template/modules/login/screens/login_page.dart';
import 'package:project_template/modules/user_profile/user_profile.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        onPressed: () {
          print(context.read<AuthenticationBloc>().state.user.email);
        },
        child: FlutterLogo(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) => BottomNavBar(
          tabs: [
            TabItem(
              title: 'Explore',
              icon: Icons.explore,
              onPressed: () {},
            ),
            TabItem(
              title: state.status == AuthenticationStatus.authenticated
                  ? 'Profile'
                  : 'Login',
              icon: Icons.contact_page_outlined,
              onPressed: () {
                state.status == AuthenticationStatus.authenticated
                    ? Navigator.of(context).push(UserProfilePage.route())
                    : Navigator.of(context).push(LoginPage.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}
