import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenTab extends StatefulWidget {
  const OpenTab({Key? key}) : super(key: key);

  @override
  _OpenTabState createState() => _OpenTabState();
}

class _OpenTabState extends State<OpenTab> {
  final WebViewController _controller = WebViewController();
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _controller,
    );
  }
}
