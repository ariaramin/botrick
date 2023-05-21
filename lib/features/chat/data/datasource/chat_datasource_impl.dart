import 'package:dio/dio.dart';
import 'package:whiz/core/constants/constants.dart';
import 'package:whiz/core/utils/api_exception.dart';
import 'package:whiz/di/di.dart';
import 'package:whiz/features/chat/data/datasource/chat_datasource.dart';
import 'package:whiz/features/chat/data/models/message.dart';

class ChatDatasourceImpl extends ChatDatasource {
  final Dio _dio = locator.get();
  final List<Message> messages = [];

  @override
  Future<List<Message>> chatAPI(String prompt) async {
    messages.add(Message(role: MessageRoleEnum.user, content: prompt));
    try {
      var response = await _dio.post(
        "${Constants.BASE_URL}${Constants.COMPLETIONS_URL}",
        data: {
          "model": "gpt-3.5-turbo",
          "messages": messages.map((element) => element.toJson()).toList(),
        },
      );
      if (response.statusCode == 200) {
        var content = response.data['choices'][0]['message']['content'];
        content = content.trim();
        messages
            .add(Message(role: MessageRoleEnum.assistant, content: content));
        // return content;
      }
      // return 'An internal error occurred';
      return messages;
    } on DioError catch (error) {
      throw ApiException(
        code: error.response?.statusCode,
        message: error.response?.data["message"],
      );
    } catch (exception) {
      // return exception.toString();
      rethrow;
    }
  }
}
