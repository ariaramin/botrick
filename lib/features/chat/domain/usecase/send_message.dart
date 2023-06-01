import 'package:dartz/dartz.dart';
import 'package:botrick/core/usecase/usecase.dart';
import 'package:botrick/core/utils/failure.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/domain/params/chat_params.dart';
import 'package:botrick/features/chat/domain/repository/chat_repository.dart';

class SendMessage extends Usecase<Failure, List<Message>> {
  final ChatRepository _repository = locator.get();

  @override
  Future<Either<Failure, List<Message>>> call(Params? params) {
    var chatParams = params != null ? params as ChatParams : null;
    if (chatParams!.prompt.startsWith("/img")) {
      return _repository.imageGeneratorAPI(chatParams.prompt);
    }
    return _repository.chatAPI(chatParams.prompt);
  }
}
