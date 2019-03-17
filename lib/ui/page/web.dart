import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
/*
 * @TIME 2019-03-17 18:52
 * @DES  TODO
 */

class WebPage extends StatefulWidget {
  final String _name;
  final String _url;

  WebPage(this._name, this._url);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    print(widget._url);
    return WebviewScaffold(
      url: 'https://www.baidu.com',
      appBar: AppBar(
        title: Text(widget._name),
      ),
    );
  }
}

/*
* Scaffold(
      appBar: AppBar(title: Text(widget._name),),
      body: WebView(initialUrl: 'http://www.baidu.com',),
    );
* */
