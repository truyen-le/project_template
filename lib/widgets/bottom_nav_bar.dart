import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key key, this.tabs}) : super(key: key);

  final List<TabItem> tabs;

  Widget _buildNavBarTab(
      {String title = 'Tab',
      IconData icon = Icons.explore,
      VoidCallback onPressed}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FlatButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(title),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          elevation: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...(tabs
                    .map((e) => _buildNavBarTab(
                          title: e.title,
                          icon: e.icon,
                          onPressed: e.onPressed,
                        ))
                    .toList())
              ],
            ),
          ),
        ));
  }
}

class TabItem {
  const TabItem({this.title, this.icon, this.onPressed});

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
}
