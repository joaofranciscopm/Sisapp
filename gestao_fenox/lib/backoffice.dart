import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BackOffice extends StatefulWidget {
  @override
  _BackOfficeState createState() => _BackOfficeState();
}

class _BackOfficeState extends State<BackOffice> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.backoffice.fenoxapp.com.br',
    );
  }
}
