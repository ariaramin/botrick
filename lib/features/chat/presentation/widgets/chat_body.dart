import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiz/features/chat/data/models/message.dart';
import 'package:whiz/features/chat/domain/entity/feature.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_state.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_status.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_item.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_textfield.dart';
import 'package:whiz/features/chat/presentation/widgets/features_item.dart';
import 'package:whiz/features/chat/presentation/widgets/scroll_button.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  late ScrollController chatScrollController;
  late double _scrollButtonPosition;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    chatScrollController = ScrollController();
    chatScrollController.addListener(_scrollListener);
    _scrollButtonPosition = 28;
  }

  @override
  void dispose() {
    super.dispose();
    chatScrollController.removeListener(_scrollListener);
    chatScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state.status is ChatLoadingState ||
                state.status is ChatLoadedState) {
              _changeTypingStatus();
            }
            if (state.status is ChatErrorState) {
              const snackBar = SnackBar(content: Text("message"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state.messages.isNotEmpty) {
              return ListView.builder(
                controller: chatScrollController,
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == (state.messages.length - 1)
                        ? const EdgeInsets.only(top: 14, bottom: 108)
                        : const EdgeInsets.symmetric(vertical: 14),
                    child: ChatItem(
                      text: state.messages[index].content!,
                      isUser:
                          state.messages[index].role == MessageRoleEnum.user,
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
                      ? const EdgeInsets.only(top: 14, bottom: 108)
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
        ScrollButton(
          scrollButtonPosition: _scrollButtonPosition,
          onTap: _scrollToBottom,
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 18,
          child: ChatTextField(enabled: !_isTyping),
        ),
      ],
    );
  }

  _scrollToBottom() {
    if (chatScrollController.hasClients) {
      final position = chatScrollController.position.maxScrollExtent;
      chatScrollController
          .animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      )
          .then((value) {
        setState(() {
          _scrollButtonPosition = MediaQuery.of(context).viewInsets.bottom + 28;
        });
      });
    }
  }

  _scrollListener() {
    if (chatScrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (chatScrollController.position.pixels ==
          chatScrollController.position.maxScrollExtent) {
        setState(() {
          _scrollButtonPosition = MediaQuery.of(context).viewInsets.bottom + 28;
        });
      } else {
        setState(() {
          _scrollButtonPosition = MediaQuery.of(context).viewInsets.bottom + 88;
        });
      }
    }
    if (chatScrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _scrollButtonPosition = MediaQuery.of(context).viewInsets.bottom + 28;
      });
    }
  }

  _changeTypingStatus() {
    setState(() {
      _isTyping = !_isTyping;
    });
  }
}
