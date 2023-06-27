import 'package:botrick/features/image_generator/presentation/bloc/image_generator_status.dart';
import 'package:equatable/equatable.dart';

class ImageGeneratorState extends Equatable {
  final ImageGeneratorStatus status;
  final List<String> images;

  const ImageGeneratorState({
    required this.status,
    required this.images,
  });

  ImageGeneratorState copyWith({
    ImageGeneratorStatus? newStatus,
    List<String>? newImages,
  }) {
    return ImageGeneratorState(
      status: newStatus ?? status,
      images: newImages ?? images,
    );
  }

  @override
  List<Object?> get props => [status, images];
}
