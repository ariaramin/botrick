import 'package:dio/dio.dart';
import 'package:whiz/core/constants/constants.dart';
import 'package:whiz/core/utils/api_exception.dart';
import 'package:whiz/di/di.dart';
import 'package:whiz/features/chat/data/datasource/chat_datasource.dart';
import 'package:whiz/features/chat/data/models/message.dart';

class ChatDatasourceImpl extends ChatDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Message>> chatAPI(String prompt) async {
    try {
      var response = await _dio.post(
        "${Constants.BASE_URL}${Constants.COMPLETIONS_URL}",
        data: {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "user",
              "content": prompt,
            }
          ]
        },
      );
      List<Message> messages = [];
      if (response.statusCode == 200) {
        if (response.data["choices"].length > 0) {
          messages = List.generate(
            response.data["choices"].length,
            (index) => Message(
              content: response.data["choices"][index]["message"]["content"],
              role: MessageRoleEnum.assistant,
            ),
          );
        }
      }
      if (response.data['error'] != null) {
        throw ApiException(
          code: response.statusCode,
          message: response.data['error']["message"],
        );
      }
      return messages;
    } on DioError catch (error) {
      throw ApiException(
        code: error.response?.statusCode,
        message: error.response?.data["message"],
      );
    } catch (exception) {
      rethrow;
    }
  }
}
