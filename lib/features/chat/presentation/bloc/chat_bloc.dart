import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/domain/usecase/send_message.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_event.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_state.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_status.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage sendMessage;

  ChatBloc(this.sendMessage)
      : super(ChatState(status: ChatInitStatus(), messages: [])) {
    on<SendMessageEvent>(
      (event, emit) async {
        // Check if the last message in the state is not a user message
        if (!event.isRetry) {
          // Create a new user message
          final userMessage = Message(
            content: event.params!.prompt,
            role: MessageRoleEnum.user,
          );
          // Add the user message to the state
          state.messages.add(userMessage);
        }

        // Emit the state with updated loading status
        emit(state.copyWith(
          newStatus: ChatLoadingStatus(),
        ));

        // Call the send message use case
        var response = await sendMessage.call(event.params);

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
