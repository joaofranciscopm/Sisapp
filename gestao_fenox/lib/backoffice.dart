import 'package:flutter/material.dart';

class BackOffice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Backoffice')),
        body: Container(
            padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        )));
  }
}
