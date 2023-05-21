import 'package:equatable/equatable.dart';
import 'package:whiz/features/chat/domain/params/chat_params.dart';

abstract class ChatEvent extends Equatable {}

class SendMessageEvent extends ChatEvent {
  final ChatParams? chatParams;

  SendMessageEvent({this.chatParams});

  @override
  List<Object?> get props => [];
}
