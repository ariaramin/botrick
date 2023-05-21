import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: const Scaffold(
        body: SafeArea(
          child: ChatBody(),
        ),
      ),
    );
  }
}
