import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiz/di/di.dart';
import 'package:whiz/features/chat/data/models/message.dart';
import 'package:whiz/features/chat/domain/usecase/send_message.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_event.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_state.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_status.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage _sendMessage = locator.get();

  ChatBloc() : super(ChatState(status: ChatInitStatus(), messages: [])) {
    on<SendMessageEvent>(
      (event, emit) async {
        state.messages.add(Message(
          content: event.chatParams!.prompt,
          role: MessageRoleEnum.user,
          type: MessageTypeEnum.text,
        ));
        emit(state.copyWith(newStatus: ChatLoadingStatus()));
        var response = await _sendMessage.call(event.chatParams);
        response.fold(
            (failure) => emit(state.copyWith(
                newStatus: ChatErrorStatus(errorMessage: failure.message))),
            (response) {
          state.messages.add(response.last);
          emit(state.copyWith(newStatus: ChatLoadedStatus()));
        });
      },
    );
  }
}
