import 'package:whiz/features/chat/data/models/message.dart';

abstract class ChatDatasource {
  Future<List<Message>> chatAPI(String prompt);

  Future<List<Message>> imageGeneratorAPI(String prompt);
}
