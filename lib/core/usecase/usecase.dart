import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

class Params extends Equatable {
  final String prompt;

  const Params({required this.prompt});

  @override
  List<Object?> get props => [prompt];
}

abstract class Usecase<Failure, T> {
  Future<Either<Failure, T>> call(Params? params);
}
