import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_articles/general_scaffold.dart';

class TextButtonDemo extends StatefulWidget {
  static final String route = 'text_button';
  @override
  _TextButtonDemoState createState() => _TextButtonDemoState();
}

class _TextButtonDemoState extends State<TextButtonDemo> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      title: 'Text Button',
      scaffoldKey: _key,
      child: Center(
        child: TextButton(
          child: Text('TB'),
          onPressed: () {
            log('Text Button clicked');
          },
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            /*backgroundColor: MaterialStateProperty.all<Color>(
              Colors.indigo.withOpacity(0.09),
            ),*/
            /*foregroundColor: MaterialStateProperty.all<Color>(
              Colors.yellow,
            ),*/
            // overlayColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
            // shadowColor: MaterialStateProperty.all<Color>(Colors.orange),
            // elevation: MaterialStateProperty.all<double>(5.0),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: Colors.indigo,
                width: 1.5,
                style: BorderStyle.solid,
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
