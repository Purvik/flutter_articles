import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_articles/general_scaffold.dart';

class OutlinedButtonDemo extends StatefulWidget {
  static final String route = 'outlined_button';
  @override
  _OutlinedButtonDemoState createState() => _OutlinedButtonDemoState();
}

class _OutlinedButtonDemoState extends State<OutlinedButtonDemo> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: 'Outlined Button',
      scaffoldKey: _key,
      child: Center(
        child: OutlinedButton(
          child: Text('OB'),
          onPressed: () {
            log('Outlined button clicked');
          },
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            /*backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blueGrey,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.yellow,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              Colors.red,
            ),*/
            /*shadowColor: MaterialStateProperty.all<Color>(
              Colors.orange,
            ),*/
            // elevation: MaterialStateProperty.all<double>(5.0),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: Colors.green,
                width: 2.5,
                style: BorderStyle.solid,
              ),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              CircleBorder(
                  // borderRadius: BorderRadius.circular(20.0),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
