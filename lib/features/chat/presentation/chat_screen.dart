import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:botrick/core/providers/sound_provider.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/chat/domain/usecase/send_message.dart';
import 'package:botrick/features/starter/presentation/bloc/connectivity_bloc.dart';
import 'package:botrick/features/starter/presentation/bloc/connectivity_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:botrick/features/chat/presentation/widgets/chat_appbar.dart';
import 'package:botrick/features/chat/presentation/widgets/chat_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (BuildContext context) => ChatBloc(
            locator.get<SendMessage>(),
          ),
        ),
        BlocProvider<ConnectivityBloc>(
          create: (BuildContext context) =>
              ConnectivityBloc()..add(CheckConnectivityEvent()),
        ),
      ],
      child: ThemeSwitchingArea(
        child: Scaffold(
          appBar: const ChatAppBar(),
          body: SafeArea(
            child: ChatBody(
              soundProvider: locator.get<SoundProvider>(),
            ),
          ),
        ),
      ),
    );
  }
}
