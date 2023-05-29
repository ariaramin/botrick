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
        final choices = response.data['choices'];
        if (choices.isNotEmpty) {
          messages.addAll(
            choices.map<Message>(
              (choice) => Message(
                content: choice['message']['content'],
                role: MessageRoleEnum.assistant,
                type: MessageTypeEnum.text,
              ),
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

  @override
  Future<List<Message>> imageGeneratorAPI(String prompt) async {
    try {
      var response = await _dio.post(
        "${Constants.BASE_URL}${Constants.IMAGE_GENERATOR_URL}",
        data: {
          "prompt": prompt,
          "n": 1,
        },
      );
      List<Message> messages = [];
      if (response.statusCode == 200) {
        messages.add(
          Message(
            content: response.data['data'][0]['url'],
            role: MessageRoleEnum.assistant,
            type: MessageTypeEnum.image,
          ),
        );
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
