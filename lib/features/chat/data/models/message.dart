class Message {
  final MessageRoleEnum? role;
  final String? content;

  Message({
    this.role,
    this.content,
  });

  toJson() => {
        'role': role == MessageRoleEnum.user ? 'user' : 'assistant',
        'content': content,
      };
}

enum MessageRoleEnum { user, assistant }
