import 'package:flutter/material.dart';
import 'package:project_template/constants/constants.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key key, this.listItems}) : super(key: key);

  final List<ItemDetail> listItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listItems.length,
      itemBuilder: (context, index) => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              child: Center(
                child: Icon(
                  listItems[index].icon,
                  color: iconColor,
                ),
              ),
            ),
            title: Text(listItems[index].title),
            subtitle: Text(listItems[index].subtitle),
            trailing: Icon(Icons.keyboard_arrow_down),
            // isThreeLine: true,
          ),
        ),
      ),
    );
  }
}

class ItemDetail {
  const ItemDetail({this.title, this.subtitle, this.icon});
  final String title;
  final String subtitle;
  final IconData icon;
}
