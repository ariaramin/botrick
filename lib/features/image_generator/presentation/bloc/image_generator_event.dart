import 'package:botrick/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';

abstract class ImageGeneratorEvent extends Equatable {}

class GenerateImageEvent extends ImageGeneratorEvent {
  final Params? params;

  GenerateImageEvent({this.params});

  @override
  List<Object?> get props => [];
}
