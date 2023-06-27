import 'package:dartz/dartz.dart';
import 'package:botrick/core/utils/failure.dart';
import 'package:botrick/features/chat/data/models/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Message>>> chatAPI(String prompt);
}
