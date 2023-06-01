import 'package:equatable/equatable.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_status.dart';

class ChatState extends Equatable {
  final ChatStatus status;
  final List<Message> messages;

  const ChatState({
    required this.status,
    required this.messages,
  });

  ChatState copyWith({
    ChatStatus? newStatus,
    List<Message>? newMessages,
  }) {
    return ChatState(
      status: newStatus ?? status,
      messages: newMessages ?? messages,
    );
  }

  @override
  List<Object?> get props => [status, messages];
}
