import 'package:botrick/core/usecase/usecase.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/domain/usecase/send_message.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockChatRepository mockChatRepository;
  late SendMessage sendMessage;

  setUp(() {
    mockChatRepository = MockChatRepository();
    sendMessage = SendMessage(mockChatRepository);
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

  test('should get list of messages from the repository', () async {
    // arrange
    when(mockChatRepository.chatAPI(params.prompt))
        .thenAnswer((realInvocation) async => const Right(messages));

    // act
    final result = await sendMessage.call(params);

    // assert
    expect(result, equals(const Right(messages)));
  });
}
