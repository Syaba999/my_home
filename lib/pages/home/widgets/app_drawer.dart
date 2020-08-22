import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_home/models/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  final ValueChanged<int> selectPage;
  final List<DrawerItem> drawerItems;

  const AppDrawer(
      {Key key, @required this.selectPage, @required this.drawerItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo_white.png',
                  height: 70,
                ),
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/images/no-avatar.jpg',
                        height: 40,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "User Name",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]..addAll(List.generate(
            drawerItems.length,
            (index) => ListTile(
                  title: Text(drawerItems[index].title),
                  onTap: () {
                    selectPage(index);
                    Navigator.of(context).pop();
                  },
                ))),
      ),
    );
  }
}
