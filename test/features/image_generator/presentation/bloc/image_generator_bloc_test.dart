import 'package:bloc_test/bloc_test.dart';
import 'package:botrick/core/usecase/usecase.dart';
import 'package:botrick/core/utils/failure.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_bloc.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_event.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_state.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_status.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGenerateImage mockGenerateImage;
  late ImageGeneratorBloc imageGeneratorBloc;

  setUp(() {
    mockGenerateImage = MockGenerateImage();
    imageGeneratorBloc = ImageGeneratorBloc(mockGenerateImage);
  });

  const Params params = Params(prompt: 'A cat');

  const List<String> imagePaths = ['path1', 'path2'];

  test('initial state should be empty', () {
    expect(imageGeneratorBloc.state,
        ImageGeneratorState(status: ImageGeneratorInitStatus(), images: []));
  });

  blocTest<ImageGeneratorBloc, ImageGeneratorState>(
    'should emits [ImageGeneratorLoadingStatus, ImageGeneratorLoadedStatus] when GenerateImageEvent is added.',
    build: () {
      when(mockGenerateImage.call(params))
          .thenAnswer((realInvocation) async => const Right(imagePaths));
      return imageGeneratorBloc;
    },
    act: (bloc) => bloc.add(GenerateImageEvent(params: params)),
    expect: () => [
      ImageGeneratorState(
          status: ImageGeneratorLoadingStatus(), images: imagePaths),
      ImageGeneratorState(
          status: ImageGeneratorLoadedStatus(), images: imagePaths)
    ],
  );

  blocTest<ImageGeneratorBloc, ImageGeneratorState>(
    'should emits [ImageGeneratorLoadingStatus, ImageGeneratorErrorStatus] when GenerateImageEvent is added.',
    build: () {
      when(mockGenerateImage.call(params))
          .thenAnswer((realInvocation) async => const Left(Failure('')));
      return imageGeneratorBloc;
    },
    act: (bloc) => bloc.add(GenerateImageEvent(params: params)),
    expect: () => [
      ImageGeneratorState(status: ImageGeneratorLoadingStatus(), images: []),
      ImageGeneratorState(
          status: ImageGeneratorErrorStatus(errorMessage: ''), images: [])
    ],
  );

  tearDown(() => imageGeneratorBloc.close());
}
