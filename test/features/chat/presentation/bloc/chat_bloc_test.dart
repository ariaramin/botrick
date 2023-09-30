import 'package:botrick/core/usecase/usecase.dart';
import 'package:botrick/core/utils/failure.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_event.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_state.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_status.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockSendMessage mockSendMessage;
  late ChatBloc chatBloc;

  setUp(() {
    mockSendMessage = MockSendMessage();
    chatBloc = ChatBloc(mockSendMessage);
  });

  const Params params = Params(prompt: 'Hello!');

  const List<Message> messages = [
    Message(
      content: 'Hello!',
      role: MessageRoleEnum.user,
    ),
    Message(
      content: 'Hello. How can i help you?',
      role: MessageRoleEnum.assistant,
    ),
  ];

  test('initial state should be empty', () {
    expect(chatBloc.state, ChatState(status: ChatInitStatus(), messages: []));
  });

  blocTest<ChatBloc, ChatState>(
    'should emits [ChatLoadingStatus, ChatLoadedStatus] when SendMessageEvent is added. (isRetry = false)',
    build: () {
      when(mockSendMessage.call(params))
          .thenAnswer((realInvocation) async => const Right(messages));
      return chatBloc;
    },
    act: (bloc) => bloc.add(SendMessageEvent(params: params)),
    expect: () => [
      ChatState(status: ChatLoadingStatus(), messages: messages),
      ChatState(status: ChatLoadedStatus(), messages: messages),
    ],
  );

  blocTest<ChatBloc, ChatState>(
    'should emits [ChatLoadingStatus, ChatLoadedStatus] when SendMessageEvent is added. (isRetry = true)',
    build: () {
      when(mockSendMessage.call(params))
          .thenAnswer((realInvocation) async => const Right(messages));
      return chatBloc;
    },
    act: (bloc) => bloc.add(SendMessageEvent(params: params, isRetry: true)),
    expect: () => [
      ChatState(status: ChatLoadingStatus(), messages: [messages.last]),
      ChatState(status: ChatLoadedStatus(), messages: [messages.last]),
    ],
  );

  blocTest<ChatBloc, ChatState>(
    'should emits [ChatLoadingStatus, ChatErrorStatus] when SendMessageEvent is added.',
    build: () {
      when(mockSendMessage.call(params))
          .thenAnswer((realInvocation) async => const Left(Failure('')));
      return chatBloc;
    },
    act: (bloc) => bloc.add(SendMessageEvent(params: params)),
    expect: () => [
      ChatState(status: ChatLoadingStatus(), messages: [messages.first]),
      ChatState(
          status: ChatErrorStatus(errorMessage: ''),
          messages: [messages.first]),
    ],
  );

  tearDown(() => chatBloc.close());
}
