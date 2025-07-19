import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'message_model.dart';

final chatProvider = StreamProvider<List<Message>>((ref) {
  return FirebaseFirestore.instance
      .collection('chats')
      .orderBy('timestamp', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            return Message.fromJson(data);
          }).toList());
});

Future<void> sendMessage(String text, String userId, String email) async {
  final msg = Message(
    text: text,
    userId: userId,
    email: email,
    timestamp: DateTime.now(),
  );
  await FirebaseFirestore.instance.collection('chats').add(msg.toJson());
}
