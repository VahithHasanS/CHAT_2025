class ChatMessage {
  final String id;
  final String text;
  final String senderId;
  final DateTime timestamp;

  ChatMessage(
      {required this.id,
      required this.text,
      required this.senderId,
      required this.timestamp});
}
