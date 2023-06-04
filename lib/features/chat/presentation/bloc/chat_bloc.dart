import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/domain/usecase/send_message.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_event.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_state.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_status.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage _sendMessage = locator.get();

  ChatBloc() : super(ChatState(status: ChatInitStatus(), messages: [])) {
    // Event listener for SendMessageEvent
    on<SendMessageEvent>(
      (event, emit) async {
        // Create a new user message
        final userMessage = Message(
          content: event.chatParams!.prompt,
          role: MessageRoleEnum.user,
          type: MessageTypeEnum.text,
        );
        // Add the user message to the state
        state.messages.add(userMessage);
        // Emit the state with updated loading status
        emit(state.copyWith(
          newStatus: ChatLoadingStatus(
            isTyping: !event.chatParams!.prompt.startsWith('/img'),
          ),
        ));
        // Call the send message use case
        var response = await _sendMessage.call(event.chatParams);
        response.fold(
          // Handle failure response from send message use case
          (failure) => emit(state.copyWith(
            newStatus: ChatErrorStatus(errorMessage: failure.message),
          )),
          // Handle success response from send message use case
          (response) {
            // Add the response message to the state
            state.messages.add(response.last);
            // Emit the state with updated loaded status
            emit(state.copyWith(newStatus: ChatLoadedStatus()));
          },
        );
      },
    );

    // Event listener for ReSendMessageEvent
    on<ReSendMessageEvent>(
      (event, emit) async {
        // Emit the state with updated loading status
        emit(state.copyWith(
          newStatus: ChatLoadingStatus(
            isTyping: !event.chatParams!.prompt.startsWith('/img'),
          ),
        ));
        // Call the send message use case
        var response = await _sendMessage.call(event.chatParams);
        response.fold(
          // Handle failure response from send message use case
          (failure) => emit(state.copyWith(
            newStatus: ChatErrorStatus(errorMessage: failure.message),
          )),
          // Handle success response from send message use case
          (response) {
            // Add the response message to the state
            state.messages.add(response.last);
            // Emit the state with updated loaded status
            emit(state.copyWith(newStatus: ChatLoadedStatus()));
          },
        );
      },
    );
  }
}
