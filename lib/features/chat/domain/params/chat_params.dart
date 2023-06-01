import 'package:botrick/core/usecase/usecase.dart';

class ChatParams extends Params {
  final String prompt;

  ChatParams({required this.prompt});

  @override
  List<Object?> get props => [];
}
