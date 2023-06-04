class Message {
  final MessageRoleEnum? role;
  final String? content;
  final MessageTypeEnum? type;

  Message({
    this.role,
    this.content,
    this.type,
  });

  toJson() => {
        'role': role == MessageRoleEnum.user ? 'user' : 'assistant',
        'content': content,
      };
}

enum MessageRoleEnum { user, assistant }

enum MessageTypeEnum { text, image }
