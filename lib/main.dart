import 'package:flutter/material.dart';
import 'package:flutter_articles/app_home.dart';
import 'package:flutter_articles/material_buttons/elevated_button.dart';
import 'package:flutter_articles/material_buttons/outlined_button.dart';
import 'package:flutter_articles/material_buttons/text_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppHome(),
      routes: {
        ElevatedButtonDemo.route: (context) => ElevatedButtonDemo(),
        OutlinedButtonDemo.route: (context) => OutlinedButtonDemo(),
        TextButtonDemo.route: (context) => TextButtonDemo(),
      },
    );
  }
}
