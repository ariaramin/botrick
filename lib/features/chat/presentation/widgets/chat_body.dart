import 'package:audioplayers/audioplayers.dart';
import 'package:botrick/features/chat/domain/params/chat_params.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:botrick/core/providers/sound_provider.dart';
import 'package:botrick/core/constants/custom_snackbar.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/domain/entity/feature.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_state.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_status.dart';
import 'package:botrick/features/chat/presentation/widgets/chat_item.dart';
import 'package:botrick/features/chat/presentation/widgets/chat_textfield.dart';
import 'package:botrick/features/chat/presentation/widgets/features_item.dart';
import 'package:botrick/features/chat/presentation/widgets/scroll_button.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final SoundProvider _soundProvider = locator.get();
  late ScrollController _chatScrollController;
  late double _scrollButtonPosition;
  late String _inputText;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _chatScrollController = ScrollController();
    _chatScrollController.addListener(_scrollListener);
    _scrollButtonPosition = 28;
  }

  @override
  void dispose() {
    super.dispose();
    _chatScrollController.removeListener(_scrollListener);
    _chatScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) => _handleChatStateChanges(state),
          builder: (context, state) {
            if (state.messages.isNotEmpty) {
              return ListView.builder(
                controller: _chatScrollController,
                reverse: true,
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  final reverseIndex = state.messages.length - 1 - index;
                  return Padding(
                    padding: reverseIndex == (state.messages.length - 1)
                        ? const EdgeInsets.only(top: 10, bottom: 108)
                        : const EdgeInsets.symmetric(vertical: 10),
                    child: ChatItem(
                      content: state.messages[reverseIndex].content!,
                      isUser: state.messages[reverseIndex].role ==
                          MessageRoleEnum.user,
                      isImage: state.messages[reverseIndex].type ==
                          MessageTypeEnum.image,
                      shouldAnimate: reverseIndex == state.messages.length - 1,
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
                      ? const EdgeInsets.only(top: 12, bottom: 108)
                      : const EdgeInsets.symmetric(vertical: 12),
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
        ScrollButton(
          scrollButtonPosition: _scrollButtonPosition,
          onTap: _scrollToBottom,
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 18,
          child: ChatTextField(
            enabled: !_isTyping,
            onSendMessage: (value) {
              _scrollToBottom();
              _inputText = value;
            },
          ),
        ),
      ],
    );
  }

  _handleChatStateChanges(ChatState state) {
    if (state.status is ChatLoadingStatus || state.status is ChatLoadedStatus) {
      _changeTypingStatus();
    }
    if (state.status is ChatLoadedStatus) {
      _playSound();
    }
    if (state.status is ChatErrorStatus) {
      _changeTypingStatus();
      final errorStatus = state.status as ChatErrorStatus;
      showSnackBar(
        context: context,
        message: errorStatus.errorMessage,
        type: SnackBarTypeEnum.error,
        onTapAction: () {
          if (_inputText.isNotEmpty) {
            BlocProvider.of<ChatBloc>(context).add(
              ReSendMessageEvent(chatParams: ChatParams(prompt: _inputText)),
            );
          }
        },
      );
    }
  }

  _playSound() {
    if (!_soundProvider.isMute) {
      final player = AudioPlayer();
      player.play(AssetSource('audios/pop.mp3'));
    }
  }

  _scrollToBottom() {
    if (_chatScrollController.hasClients) {
      final position = _chatScrollController.position.minScrollExtent;
      _chatScrollController
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
    if (_chatScrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_chatScrollController.position.pixels ==
          _chatScrollController.position.minScrollExtent) {
        setState(() {
          _scrollButtonPosition = MediaQuery.of(context).viewInsets.bottom + 28;
        });
      } else {
        setState(() {
          _scrollButtonPosition = MediaQuery.of(context).viewInsets.bottom + 88;
        });
      }
    }
    if (_chatScrollController.position.userScrollDirection ==
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
