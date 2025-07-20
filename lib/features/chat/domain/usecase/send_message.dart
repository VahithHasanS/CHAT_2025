//import '../repositories/chat_repository.dart';

//import 'package:chat_app/features/chat/domain/entities/chat_message.dart';
//import 'package:chat_app/features/chat/domain/repositories/chat_repositories.dart';
import 'package:chat_application_2025/features/chat/domain/entities/chat_message.dart';
import 'package:chat_application_2025/features/chat/domain/repositories/chat_repositories.dart';

class SendMessage {
  final ChatRepository repo;

  SendMessage(this.repo);

  Future<void> call(ChatMessage message) {
    return repo.sendMessage(message);
  }
}
