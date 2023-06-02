import 'package:equatable/equatable.dart';
import 'package:botrick/features/chat/domain/params/chat_params.dart';

abstract class ChatEvent extends Equatable {}

class SendMessageEvent extends ChatEvent {
  final ChatParams? chatParams;

  SendMessageEvent({this.chatParams});

  @override
  List<Object?> get props => [];
}

class ReSendMessageEvent extends ChatEvent {
  final ChatParams? chatParams;

  ReSendMessageEvent({this.chatParams});

  @override
  List<Object?> get props => [];
}
