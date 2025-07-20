//import 'package:chat_app/features/chat/data/models/message_model.dart';
//import 'package:chat_app/features/chat/domain/repositories/chat_repositories.dart';
import 'package:chat_application_2025/features/chat/data/models/message_model.dart';
import 'package:chat_application_2025/features/chat/domain/repositories/chat_repositories.dart';

import '../../domain/entities/chat_message.dart';

class ChatRepositoryImpl implements ChatRepository {
  final dynamic source;

  ChatRepositoryImpl(this.source);

  @override
  Future<void> sendMessage(ChatMessage msg) async {
    final model = MessageModel(
      userId: msg.id,
      text: msg.text,
      email: msg.senderId,
      timestamp: msg.timestamp,
    );
    await source.sendMessage(model);
  }
}
