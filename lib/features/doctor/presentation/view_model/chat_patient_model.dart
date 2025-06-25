// models/chat_user_model.dart

class ChatUserModel {
  final String name;
  final String imageUrl;
  final String lastMessage;
  final String lastTime;

  ChatUserModel({
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastTime,
  });
}
