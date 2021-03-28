// Trevor: I implemented this html form into flutter using the following video:
//   https://www.youtube.com/watch?v=8paqPlzigM0

// Component to display an HTML form within the website, without
// redirecting to another page in Flutter

// NOTE!!!!! This file may not even be used, since the implementation in formpage is
// currently using flutter_html while this file's implementation uses flutter_webview.
// I chose to use flutter_html since the other implementation was throwing an error (
// possibly due to web dev instead of mobile)

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';  // for rootBundle
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

class AnonForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormState();
  }
}

class _FormState extends State<AnonForm> {
  WebViewController _webViewController;
  String filePath = '../QuickForm/index.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadHtmlFromAssets();
        },
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
