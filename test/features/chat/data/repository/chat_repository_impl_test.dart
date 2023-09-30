import 'dart:io';

import 'package:botrick/core/utils/api_exception.dart';
import 'package:botrick/core/utils/failure.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/data/repository/chat_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockChatDatasource mockChatDatasource;
  late ChatRepositoryImpl chatRepositoryImpl;

  setUp(() {
    mockChatDatasource = MockChatDatasource();
    chatRepositoryImpl = ChatRepositoryImpl(mockChatDatasource);
  });

  const String prompt = 'Hello!';

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

  group('get messages', () {
    test('should get list of messages from data source', () async {
      // arrange
      when(mockChatDatasource.chatAPI(prompt))
          .thenAnswer((realInvocation) async => messages);

      // act
      final result = await chatRepositoryImpl.chatAPI(prompt);

      // assert
      expect(result, equals(const Right(messages)));
    });

    test('should return server failure from data source', () async {
      // arrange
      when(mockChatDatasource.chatAPI(prompt)).thenThrow(ApiException());

      // act
      final result = await chatRepositoryImpl.chatAPI(prompt);

      // assert
      expect(result, equals(Left(Failure.serverFailure(''))));
    });

    test('should return connection failure from data source', () async {
      // arrange
      when(mockChatDatasource.chatAPI(prompt))
          .thenThrow(const SocketException(''));

      // act
      final result = await chatRepositoryImpl.chatAPI(prompt);

      // assert
      expect(result, equals(Left(Failure.connectionFailure())));
    });
  });
}
