import 'package:botrick/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {}

class SendMessageEvent extends ChatEvent {
  final Params? params;

  SendMessageEvent({this.params});

  @override
  List<Object?> get props => [];
}
