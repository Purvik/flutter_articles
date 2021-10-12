import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_articles/general_scaffold.dart';

class ElevatedButtonDemo extends StatefulWidget {
  static final String route = 'elevated_button';
  @override
  _ElevatedButtonDemoState createState() => _ElevatedButtonDemoState();
}

class _ElevatedButtonDemoState extends State<ElevatedButtonDemo> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: 'Elevated Button',
      scaffoldKey: _key,
      child: Center(
        child: ElevatedButton(
          child: Text('1'),
          onPressed: () {
            log('ElevatedButton button clicked');
          },
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blueAccent,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.yellow,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              Colors.red,
            ),
            shadowColor: MaterialStateProperty.all<Color>(
              Colors.green,
            ),
            elevation: MaterialStateProperty.all<double>(5.0),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: Colors.yellow,
                width: 3.0,
              ),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              CircleBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
