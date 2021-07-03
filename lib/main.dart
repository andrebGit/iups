import 'package:flutter/material.dart';
import 'page/index.dart';
import 'page/splashPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String title = 'IUPS';
  final String version = 'Beta 0.1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[700],
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: '$title $version',
      home: SplashPage(
        title: title,
        version: version,
      ),
      routes: {'/index': (BuildContext context) => Index()},
    );
  }
}
