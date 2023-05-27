import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_appbar.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: ThemeSwitchingArea(
        child: Scaffold(
          appBar: ChatAppBar(),
          body: const SafeArea(
            child: ChatBody(),
          ),
        ),
      ),
    );
  }
}
