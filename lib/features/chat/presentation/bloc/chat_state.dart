import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:whiz/core/utils/failure.dart';
import 'package:whiz/features/chat/data/models/message.dart';

abstract class ChatState extends Equatable {}

class ChatInitState extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoadingState extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatErrorState extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatResponseState extends ChatState {
  final Either<Failure, List<Message>> chatResponse;

  ChatResponseState({required this.chatResponse});

  @override
  List<Object?> get props => [];
}

class ChatMessagesState extends ChatState {
  final List<Message> chatMessages;

  ChatMessagesState({required this.chatMessages});

  @override
  List<Object?> get props => [chatMessages];
}
