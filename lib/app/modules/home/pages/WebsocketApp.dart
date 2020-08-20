
import 'package:flutter/material.dart';

import 'message_page.dart';

class WebsocketAp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'WebSocket Demo';
    return MaterialApp(
      title: title,
      home: MessagePag(),
    );
  }
}