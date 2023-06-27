import 'package:botrick/features/chat/data/models/message.dart';

abstract class ChatDatasource {
  Future<List<Message>> chatAPI(String prompt);
}
