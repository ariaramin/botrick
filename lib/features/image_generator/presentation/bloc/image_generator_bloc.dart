import 'package:botrick/features/image_generator/domain/usecase/generate_image.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_event.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_state.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageGeneratorBloc
    extends Bloc<ImageGeneratorEvent, ImageGeneratorState> {
  final GenerateImage generateImage;

  ImageGeneratorBloc(this.generateImage)
      : super(ImageGeneratorState(
            status: ImageGeneratorInitStatus(), images: [])) {
    on<GenerateImageEvent>(
      (event, emit) async {
        // Emit the state with updated loading status
        emit(state.copyWith(
          newStatus: ImageGeneratorLoadingStatus(),
        ));

        // Call the generate image use case
        var response = await generateImage.call(event.params);

        response.fold(
          // Handle failure response from generate image use case
          (failure) => emit(state.copyWith(
            newStatus: ImageGeneratorErrorStatus(errorMessage: failure.message),
          )),

          // Handle success response from generate image use case
          (response) {
            // Add the response images to the state
            state.images.clear();
            // Add all the images from the response to the state
            state.images.addAll(response);
            // Emit the state with updated loaded status
            emit(state.copyWith(newStatus: ImageGeneratorLoadedStatus()));
          },
        );
      },
    );
  }
}
