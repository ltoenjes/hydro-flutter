import 'package:flutter/material.dart';
import 'package:hydro_flutter/config.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveStreamPage extends StatefulWidget {
  @override
  _LiveStreamPageState createState() => _LiveStreamPageState();
}

class _LiveStreamPageState extends State<LiveStreamPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox.expand(
      child: AspectRatio(
        aspectRatio: 1920 / 1080,
        child: WebView(
          initialUrl: '$BASE_PATH:8000',
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
