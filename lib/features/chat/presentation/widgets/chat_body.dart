import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/features/chat/data/models/message.dart';
import 'package:whiz/features/chat/domain/entity/feature.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_event.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_state.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_item.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_textfield.dart';
import 'package:whiz/features/chat/presentation/widgets/features_item.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            print(state);
            if (state is ChatLoadingState) {
              setState(() {
                _isTyping = true;
              });
            }
            if (state is ChatMessagesState) {
              setState(() {
                _isTyping = false;
              });
            }
            if (state is ChatErrorState) {
              const snackBar = SnackBar(content: Text("message"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is ChatMessagesState) {
              return ListView.builder(
                itemCount: state.chatMessages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == (state.chatMessages.length - 1)
                        ? const EdgeInsets.only(top: 14, bottom: 106)
                        : const EdgeInsets.symmetric(vertical: 14),
                    child: ChatItem(
                      text: state.chatMessages[index].content!,
                      isUser: state.chatMessages[index].role ==
                          MessageRoleEnum.user,
                    ),
                  );
                },
              );
            }
            return ListView.builder(
              itemCount: Feature.getFeatures().length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == Feature.getFeatures().length - 1
                      ? const EdgeInsets.only(top: 14, bottom: 106)
                      : const EdgeInsets.symmetric(vertical: 14),
                  child: FeaturesItem(
                    iconData: Feature.getFeatures()[index].iconData,
                    title: Feature.getFeatures()[index].title!,
                    descriptions: Feature.getFeatures()[index].descriptions,
                  ),
                );
              },
            );
          },
        ),
        Visibility(
          visible: _isTyping,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 18,
          child: const ChatTextField(),
        ),
      ],
    );
  }
}
