import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:botrick/core/utils/api_exception.dart';
import 'package:botrick/core/utils/failure.dart';
import 'package:botrick/features/chat/data/datasource/chat_datasource.dart';
import 'package:botrick/features/chat/data/models/message.dart';
import 'package:botrick/features/chat/domain/repository/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatDatasource datasource;

  ChatRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Message>>> chatAPI(String prompt) async {
    try {
      var response = await datasource.chatAPI(prompt);
      return right(response);
    } on ApiException catch (error) {
      return left(Failure.serverFailure(error.message));
    } on SocketException {
      return left(Failure.connectionFailure());
    }
  }
}
