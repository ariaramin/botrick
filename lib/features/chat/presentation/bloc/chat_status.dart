import 'package:equatable/equatable.dart';

abstract class ChatStatus extends Equatable {}

class ChatInitStatus extends ChatStatus {
  @override
  List<Object?> get props => [];
}

class ChatLoadingStatus extends ChatStatus {
  final bool isTyping;

  ChatLoadingStatus({this.isTyping = true});

  @override
  List<Object?> get props => [];
}

class ChatLoadedStatus extends ChatStatus {
  @override
  List<Object?> get props => [];
}

class ChatErrorStatus extends ChatStatus {
  final String errorMessage;

  ChatErrorStatus({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
