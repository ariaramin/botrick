import 'package:equatable/equatable.dart';

abstract class ChatStatus extends Equatable {}

class ChatInitState extends ChatStatus {
  @override
  List<Object?> get props => [];
}

class ChatLoadingState extends ChatStatus {
  @override
  List<Object?> get props => [];
}

class ChatLoadedState extends ChatStatus {
  @override
  List<Object?> get props => [];
}

class ChatErrorState extends ChatStatus {
  @override
  List<Object?> get props => [];
}
