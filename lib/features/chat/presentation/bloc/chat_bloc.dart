import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiz/di/di.dart';
import 'package:whiz/features/chat/domain/usecase/send_message.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_event.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage _sendMessage = locator.get();

  ChatBloc() : super(ChatInitState()) {
    on<SendMessageEvent>(
      (event, emit) async {
        emit(ChatLoadingState());
        var response = await _sendMessage.call(event.chatParams);
        emit(ChatResponseState(chatResponse: response));
      },
    );
  }
}
