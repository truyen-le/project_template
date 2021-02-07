import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key key, this.tabs}) : super(key: key);

  final Map<String, IconData> tabs;

  Widget _buildNavBarTab(
      {String title = 'Tab', IconData icon = Icons.explore}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FlatButton(
          onPressed: () {},
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
                ...(tabs.entries
                    .map((e) => _buildNavBarTab(
                          title: e.key,
                          icon: e.value,
                        ))
                    .toList())
              ],
            ),
          ),
        ));
  }
}
