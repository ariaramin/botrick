import 'dart:io';

import 'package:botrick/core/utils/api_exception.dart';
import 'package:botrick/core/utils/failure.dart';
import 'package:botrick/features/image_generator/data/datasource/image_generator_datasource.dart';
import 'package:botrick/features/image_generator/domain/repository/image_generator_repository.dart';
import 'package:dartz/dartz.dart';

class ImageGeneratorRepositoryImpl extends ImageGeneratorRepository {
  final ImageGeneratorDatasource datasource;

  ImageGeneratorRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<String>>> imageGeneratorAPI(String prompt) async {
    try {
      var response = await datasource.imageGeneratorAPI(prompt);
      return right(response);
    } on ApiException catch (error) {
      return left(Failure.serverFailure(error.message));
    } on SocketException {
      return left(Failure.connectionFailure());
    }
  }
}
