import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/core/authentication/authentication.dart';
import 'package:project_template/modules/login/login.dart';
import 'package:project_template/modules/user_profile/user_profile.dart';
import 'package:project_template/widgets/widgets.dart';

class ExplorePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ExplorePage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: 1,
            iconSize: 15,
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Explore',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FlatButton(
                  color: Colors.black12,
                  child: Text('Cancel'),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {},
          child: Icon(
            Icons.search,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
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
      ),
    );
  }
}
