import 'package:botrick/features/image_generator/domain/repository/image_generator_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:botrick/core/usecase/usecase.dart';
import 'package:botrick/core/utils/failure.dart';

class GenerateImage extends Usecase<Failure, List<String>> {
  final ImageGeneratorRepository repository;

  GenerateImage(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(Params? params) {
    return repository.imageGeneratorAPI(params!.prompt.trim());
  }
}
