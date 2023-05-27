import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:whiz/core/utils/api_exception.dart';
import 'package:whiz/core/utils/failure.dart';
import 'package:whiz/di/di.dart';
import 'package:whiz/features/chat/data/datasource/chat_datasource.dart';
import 'package:whiz/features/chat/data/models/message.dart';
import 'package:whiz/features/chat/domain/repository/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatDatasource _datasource = locator.get();

  @override
  Future<Either<Failure, List<Message>>> chatAPI(String prompt) async {
    try {
      var response = await _datasource.chatAPI(prompt);
      return right(response);
    } on ApiException catch (error) {
      return left(Failure.serverFailure(error.message));
    } on SocketException {
      return left(Failure.connectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Message>>> imageGeneratorAPI(
      String prompt) async {
    try {
      var response = await _datasource.imageGeneratorAPI(prompt);
      return right(response);
    } on ApiException catch (error) {
      return left(Failure.serverFailure(error.message));
    } on SocketException {
      return left(Failure.connectionFailure());
    }
  }
}
