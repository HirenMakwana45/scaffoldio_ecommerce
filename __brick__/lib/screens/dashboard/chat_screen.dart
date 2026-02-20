import 'package:flutter/material.dart';

import '../../extensions/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Chat",
        center: true,
        context: context,
        showBack: false,
      ),
    );
  }
}
