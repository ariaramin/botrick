import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/utils/api_exception.dart';
import 'package:botrick/features/image_generator/data/datasource/image_generator_datasource.dart';
import 'package:dio/dio.dart';

class ImageGeneratorDatasourceImpl extends ImageGeneratorDatasource {
  final Dio dio;

  ImageGeneratorDatasourceImpl(this.dio);

  @override
  Future<List<String>> imageGeneratorAPI(String prompt) async {
    try {
      var response = await dio.post(
        '${Constants.baseUrl}${Constants.imageGeneratorUrl}',
        data: {
          'prompt': prompt,
          'n': 4,
          'size': '1024x1024',
        },
      );

      List<String> images = [];
      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data.isNotEmpty) {
          // Adding images to the list
          images = List.generate(
            data.length,
            (index) => data[index]['url'],
          );
        }
      }

      if (response.data['error'] != null) {
        // Throwing an ApiException if there's an error
        throw ApiException(
          code: response.statusCode,
          message: response.data['error']['message'],
        );
      }
      return images;
    } on DioError catch (error) {
      // Throwing an ApiException if there's a DioError
      throw ApiException(
        code: error.response?.statusCode,
        message: error.response?.data['error']['message'],
      );
    } catch (exception) {
      // Rethrowing any other exception
      rethrow;
    }
  }
}
