import 'package:whiz/di/di.dart';
import 'package:whiz/features/chat/data/datasource/chat_datasource.dart';
import 'package:whiz/features/chat/domain/repository/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatDatasource _datasource = locator.get();

  @override
  Future<String> chatAPI(String prompt) {
    return _datasource.chatAPI(prompt);
  }
}
