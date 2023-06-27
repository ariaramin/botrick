import 'package:dartz/dartz.dart';
import 'package:botrick/core/usecase/usecase.dart';
import 'package:botrick/core/utils/failure.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/domain/repository/chat_repository.dart';

class SendMessage extends Usecase<Failure, List<Message>> {
  final ChatRepository repository;

  SendMessage(this.repository);

  @override
  Future<Either<Failure, List<Message>>> call(Params? params) {
    return repository.chatAPI(params!.prompt.trim());
  }
}
