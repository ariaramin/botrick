import 'package:equatable/equatable.dart';
import 'package:botrick/core/constants/constants.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [];

  factory Failure.connectionFailure() =>
      Failure(Constants.CONNECTION_ERROR_MESSAGE);

  factory Failure.serverFailure(String? message) =>
      Failure(message ?? Constants.ERROR_MESSAGE);
}
