// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:chat_app/core/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import '../../core/providers.dart';
import 'chat_controller.dart';

class ChatScreen extends ConsumerWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatAsync = ref.watch(chatProvider);
    final user = ref.watch(firebaseAuthProvider).currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            onPressed: () => ref.read(firebaseAuthProvider).signOut(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: chatAsync.when(
              data: (messages) => ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (_, i) => ListTile(
                  title: Text(messages[i].text),
                  subtitle: Text(messages[i].email),
                ),
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: controller,
                        decoration: InputDecoration(hintText: 'Message...'))),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    if (controller.text.trim().isEmpty) return;
                    await sendMessage(
                        controller.text.trim(), user.uid, user.email ?? 'User');
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
