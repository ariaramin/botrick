import 'package:botrick/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {}

class SendMessageEvent extends ChatEvent {
  final Params? params;
  final bool isRetry;

  SendMessageEvent({
    this.params,
    this.isRetry = false,
  });

  @override
  List<Object?> get props => [];
}
