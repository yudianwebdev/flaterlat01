import 'dart:io';

import 'package:flaterlat01/Components/AdsBanner.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Column(
      children: [
        Expanded(
          child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: "https://quran.edsentra.id/"),
        ),
        Container(
            color: Colors.white, width: double.infinity, child: AdsBanner()),
      ],
    )));

    // SafeArea(
    //   child: Text("tes text"),
    // );
  }
}
