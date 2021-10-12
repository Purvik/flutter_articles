import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_articles/general_scaffold.dart';
import 'package:flutter_articles/material_buttons/elevated_button.dart';
import 'package:flutter_articles/material_buttons/outlined_button.dart';
import 'package:flutter_articles/material_buttons/text_button.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<String> _items = [
    'Elevated Button',
    'Outlined Button',
    'Text Button',
  ];

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      scaffoldKey: GlobalKey<ScaffoldState>(),
      title: "App Home",
      child: ListView.separated(
        itemCount: _items.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return Divider(
            height: 1.0,
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5.0,
            ),
            title: Text(
              '${_items[index]}',
              style: Theme.of(context).textTheme.headline5,
            ),
            onTap: () => _onItemTap(index),
          );
        },
      ),
    );
  }

  void _onItemTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, ElevatedButtonDemo.route);
        break;
      case 1:
        Navigator.pushNamed(context, OutlinedButtonDemo.route);
        break;
      case 2:
        Navigator.pushNamed(context, TextButtonDemo.route);
        break;
    }
  }
}
