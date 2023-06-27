import 'package:botrick/core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ImageGeneratorRepository {
  Future<Either<Failure, List<String>>> imageGeneratorAPI(String prompt);
}
