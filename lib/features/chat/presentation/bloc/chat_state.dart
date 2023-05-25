import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:whiz/core/utils/failure.dart';
import 'package:whiz/features/chat/data/models/message.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_status.dart';

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

// class ChatInitState extends ChatState {
//   @override
//   List<Object?> get props => [];
// }

// class ChatLoadingState extends ChatState {
//   @override
//   List<Object?> get props => [];
// }

// class ChatErrorState extends ChatState {
//   @override
//   List<Object?> get props => [];
// }

// class ChatResponseState extends ChatState {
//   final Either<Failure, List<Message>> chatResponse;

//   ChatResponseState({required this.chatResponse});

//   @override
//   List<Object?> get props => [];
// }

// class ChatMessagesState extends ChatState {
//   final List<Message> chatMessages;

//   ChatMessagesState({required this.chatMessages});

//   @override
//   List<Object?> get props => [chatMessages];
// }
