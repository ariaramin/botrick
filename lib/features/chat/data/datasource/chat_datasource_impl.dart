import 'package:dio/dio.dart';
import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/utils/api_exception.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/chat/data/datasource/chat_datasource.dart';
import 'package:botrick/features/chat/data/models/message.dart';

class ChatDatasourceImpl extends ChatDatasource {
  final Dio _dio = locator.get();
  List<Message> messages = [];

  @override
  Future<List<Message>> chatAPI(String prompt) async {
    try {
      // Adding user message to the list
      messages.add(Message(
        content: prompt,
        role: MessageRoleEnum.user,
        type: MessageTypeEnum.text,
      ));

      var response = await _dio.post(
        "${Constants.BASE_URL}${Constants.COMPLETIONS_URL}",
        data: {
          "model": "gpt-3.5-turbo",
          "messages": messages.map((element) => element.toJson()).toList()
        },
      );

      if (response.statusCode == 200) {
        final choices = response.data['choices'];
        if (choices.isNotEmpty) {
          // Adding assistant messages to the list
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
        // Throwing an ApiException if there's an error
        throw ApiException(
          code: response.statusCode,
          message: response.data['error']["message"],
        );
      }
      return messages;
    } on DioError catch (error) {
      // Throwing an ApiException if there's a DioError
      throw ApiException(
        code: error.response?.statusCode,
        message: error.response?.data["message"],
      );
    } catch (exception) {
      // Rethrowing any other exception
      rethrow;
    }
  }

  @override
  Future<List<Message>> imageGeneratorAPI(String prompt) async {
    try {
      // Adding user message to the list
      messages.add(Message(
        content: prompt,
        role: MessageRoleEnum.user,
        type: MessageTypeEnum.text,
      ));

      var response = await _dio.post(
        "${Constants.BASE_URL}${Constants.IMAGE_GENERATOR_URL}",
        data: {
          "prompt": prompt,
          "n": 1,
          "size": "512x512",
        },
      );

      if (response.statusCode == 200) {
        // Adding assistant message with generated image URL to the list
        messages.add(
          Message(
            content: response.data['data'][0]['url'],
            role: MessageRoleEnum.assistant,
            type: MessageTypeEnum.image,
          ),
        );
      }

      if (response.data['error'] != null) {
        // Throwing an ApiException if there's an error
        throw ApiException(
          code: response.statusCode,
          message: response.data['error']["message"],
        );
      }
      return messages;
    } on DioError catch (error) {
      // Throwing an ApiException if there's a DioError
      throw ApiException(
        code: error.response?.statusCode,
        message: error.response?.data["message"],
      );
    } catch (exception) {
      // Rethrowing any other exception
      rethrow;
    }
  }
}
