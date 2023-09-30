import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final MessageRoleEnum? role;
  final String? content;

  const Message({
    this.role,
    this.content,
  });

  toJson() => {
        'role': role == MessageRoleEnum.user ? 'user' : 'assistant',
        'content': content,
      };

  @override
  List<Object?> get props => [role, content];
}

enum MessageRoleEnum { user, assistant }
