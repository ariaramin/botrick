import 'package:flutter/material.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ChatBody(),
      ),
    );
  }
}
