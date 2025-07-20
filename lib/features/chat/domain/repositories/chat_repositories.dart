//import 'package:chat_app/features/chat/domain/entities/chat_message.dart';
import 'package:chat_application_2025/features/chat/domain/entities/chat_message.dart';

abstract class ChatRepository {
  Future<void> sendMessage(ChatMessage message);
}
