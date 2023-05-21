import 'package:dartz/dartz.dart';
import 'package:whiz/core/utils/failure.dart';
import 'package:whiz/features/chat/data/models/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<Message>>> chatAPI(String prompt);
}
