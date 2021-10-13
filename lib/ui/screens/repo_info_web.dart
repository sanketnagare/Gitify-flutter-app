import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfoScreen extends StatefulWidget {
  String Title;
  String url;

  InfoScreen(this.Title, this.url);
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _key = UniqueKey();
  Completer<WebViewController> _controller = Completer<WebViewController>();
  var _isLoading;
  var _init=true;
   
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
  }
  int position = 1;
  doneLoading(String A)
  {
    setState(() {
      position = 0;
    });
  }
  startLoading(String A)
  {
    setState(() {
      position = 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Title),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),

      body: IndexedStack(
        index: position,
      children: <Widget>[
           WebView(
              key: _key,
              initialUrl: widget.url,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onPageFinished: doneLoading,
              onPageStarted: startLoading,
            ),
            Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ))
      ],
    ));
  }
}
