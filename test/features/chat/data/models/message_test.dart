import 'package:botrick/features/chat/data/models/message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const Message message = Message(
    content:
        'The 2020 World Series was played in Texas at Globe Life Field in Arlington.',
    role: MessageRoleEnum.assistant,
  );

  group('to json', () {
    test('should return a json map', () {
      final result = message.toJson();

      final Map<String, dynamic> expectedJson = {
        'content':
            'The 2020 World Series was played in Texas at Globe Life Field in Arlington.',
        'role': 'assistant'
      };

      expect(result, equals(expectedJson));
    });
  });
}
