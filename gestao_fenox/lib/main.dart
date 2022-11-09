import 'package:flutter/material.dart';
import 'package:loginpage/backoffice.dart';

import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fenox Tecnlogia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        initialRoute: 'homepage',
        routes: {
          "/backoffice": (context) => BackOffice(),
        });
  }
}
