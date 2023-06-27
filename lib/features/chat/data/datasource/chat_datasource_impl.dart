import 'package:dio/dio.dart';
import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/utils/api_exception.dart';
import 'package:botrick/features/chat/data/datasource/chat_datasource.dart';
import 'package:botrick/features/chat/data/models/message.dart';

class ChatDatasourceImpl extends ChatDatasource {
  final Dio dio;
  List<Message> messages = [];

  ChatDatasourceImpl(this.dio);

  @override
  Future<List<Message>> chatAPI(String prompt) async {
    try {
      // Adding user message to the list
      messages.add(Message(
        content: prompt,
        role: MessageRoleEnum.user,
      ));

      var response = await dio.post(
        '${Constants.baseUrl}${Constants.completionsUrl}',
        data: {
          'model': 'gpt-3.5-turbo',
          'messages': messages.map((element) => element.toJson()).toList()
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
              ),
            ),
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
      return messages;
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
