class MessageModel {
  final String text;
  final String userId;
  final String email;
  final DateTime timestamp;

  MessageModel({
    required this.text,
    required this.userId,
    required this.email,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'userId': userId,
        'email': email,
        'timestamp': timestamp.toIso8601String(),
      };

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        text: json['text'],
        userId: json['userId'],
        email: json['email'],
        timestamp: DateTime.parse(json['timestamp']),
      );
}
