import 'dart:io';

import 'package:botrick/core/utils/api_exception.dart';
import 'package:botrick/core/utils/failure.dart';
import 'package:botrick/features/image_generator/data/repository/image_generator_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockImageGeneratorDatasource mockImageGeneratorDatasource;
  late ImageGeneratorRepositoryImpl imageGeneratorRepositoryImpl;

  setUp(() {
    mockImageGeneratorDatasource = MockImageGeneratorDatasource();
    imageGeneratorRepositoryImpl = ImageGeneratorRepositoryImpl(
      mockImageGeneratorDatasource,
    );
  });

  const String prompt = 'A cat';

  final List<String> imagePaths = ['path1', 'path2'];

  group('get image paths', () {
    test('should get list of image paths from data source', () async {
      // arrange
      when(mockImageGeneratorDatasource.imageGeneratorAPI(prompt))
          .thenAnswer((realInvocation) async => imagePaths);

      // act
      final result =
          await imageGeneratorRepositoryImpl.imageGeneratorAPI(prompt);

      // assert
      expect(result, equals(Right(imagePaths)));
    });

    test('should return server failure from data source', () async {
      // arrange
      when(mockImageGeneratorDatasource.imageGeneratorAPI(prompt))
          .thenThrow(ApiException());

      // act
      final result =
          await imageGeneratorRepositoryImpl.imageGeneratorAPI(prompt);

      // assert
      expect(result, equals(Left(Failure.serverFailure(''))));
    });

    test('should return connection failure from data source', () async {
      // arrange
      when(mockImageGeneratorDatasource.imageGeneratorAPI(prompt))
          .thenThrow(const SocketException(''));

      // act
      final result =
          await imageGeneratorRepositoryImpl.imageGeneratorAPI(prompt);

      // assert
      expect(result, equals(Left(Failure.connectionFailure())));
    });
  });
}
