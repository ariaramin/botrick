import 'package:flutter/material.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:audioplayers/audioplayers.dart';

class ChatItem extends StatefulWidget {
  final String text;
  final bool isUser;

  const ChatItem({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  void initState() {
    super.initState();
    // _playSound();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment:
            widget.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 105),
            margin: widget.isUser
                ? const EdgeInsets.only(left: 68)
                : const EdgeInsets.only(right: 68),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            decoration: ShapeDecoration(
              color: widget.isUser
                  ? AppColors.primaryColor
                  : Theme.of(context).colorScheme.primaryContainer,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(38),
                  bottomRight:
                      widget.isUser ? Radius.zero : const Radius.circular(38),
                  bottomLeft:
                      widget.isUser ? const Radius.circular(38) : Radius.zero,
                  topRight: const Radius.circular(38),
                ),
              ),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                color: widget.isUser
                    ? Colors.white
                    : Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _playSound() {
    if (!widget.isUser) {
      final player = AudioPlayer();
      player.play(AssetSource('audios/pop.mp3'));
    }
  }
}
