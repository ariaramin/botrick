import 'package:botrick/core/usecase/usecase.dart';
import 'package:botrick/features/image_generator/domain/usecase/generate_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockImageGeneratorRepository mockImageGeneratorRepository;
  late GenerateImage generateImage;

  setUp(() {
    mockImageGeneratorRepository = MockImageGeneratorRepository();
    generateImage = GenerateImage(mockImageGeneratorRepository);
  });

  const Params params = Params(prompt: 'A cat');

  final List<String> images = ['path1', 'path2'];

  test('should get list of string (image paths)', () async {
    // arrange
    when(mockImageGeneratorRepository.imageGeneratorAPI(params.prompt))
        .thenAnswer((realInvocation) async => Right(images));

    // act
    final result = await generateImage.call(params);

    // assert
    expect(result, equals(Right(images)));
  });
}
