import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiz/di/di.dart';
import 'package:whiz/features/chat/data/models/message.dart';
import 'package:whiz/features/chat/domain/usecase/send_message.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_event.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage _sendMessage = locator.get();
  final List<Message> _messages = [];

  ChatBloc() : super(ChatInitState()) {
    on<SendMessageEvent>(
      (event, emit) async {
        _messages.add(Message(
            role: MessageRoleEnum.user, content: event.chatParams!.prompt));
        emit(ChatMessagesState(chatMessages: _messages));
        emit(ChatLoadingState());
        var response = await _sendMessage.call(event.chatParams);
        response.fold((l) => emit(ChatErrorState()), (response) {
          _messages.addAll(response);
        });
        // emit(ChatLoadingState());
        emit(ChatMessagesState(chatMessages: _messages));
      },
    );
  }
}
