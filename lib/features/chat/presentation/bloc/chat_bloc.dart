import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiz/di/di.dart';
import 'package:whiz/features/chat/data/models/message.dart';
import 'package:whiz/features/chat/domain/usecase/send_message.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_event.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_state.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_status.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage _sendMessage = locator.get();

  ChatBloc() : super(ChatState(status: ChatInitState(), messages: [])) {
    on<SendMessageEvent>(
      (event, emit) async {
        state.messages.add(Message(
            role: MessageRoleEnum.user, content: event.chatParams!.prompt));
        emit(state.copyWith(newStatus: ChatLoadingState()));
        var response = await _sendMessage.call(event.chatParams);
        response.fold((l) => emit(state.copyWith(newStatus: ChatErrorState())),
            (response) {
          state.messages.addAll(response);
          emit(state.copyWith(newStatus: ChatLoadedState()));
        });
      },
    );
  }
}
