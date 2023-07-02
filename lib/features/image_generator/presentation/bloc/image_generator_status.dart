import 'package:equatable/equatable.dart';

abstract class ImageGeneratorStatus extends Equatable {}

class ImageGeneratorInitStatus extends ImageGeneratorStatus {
  @override
  List<Object?> get props => [];
}

class ImageGeneratorLoadingStatus extends ImageGeneratorStatus {
  @override
  List<Object?> get props => [];
}

class ImageGeneratorLoadedStatus extends ImageGeneratorStatus {
  @override
  List<Object?> get props => [];
}

class ImageGeneratorErrorStatus extends ImageGeneratorStatus {
  final String errorMessage;

  ImageGeneratorErrorStatus({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

class ImageSavingStatus extends ImageGeneratorStatus {
  @override
  List<Object?> get props => [];
}

class SaveImageResponseStatus extends ImageGeneratorStatus {
  @override
  List<Object?> get props => [];
}
