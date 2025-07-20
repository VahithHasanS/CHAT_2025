// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

//import 'package:chat_app/core/provider.dart';
import 'package:chat_application_2025/core/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import '../../core/providers.dart';

class AuthScreen extends ConsumerWidget {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(firebaseAuthProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Login/Signup')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: emailCtrl,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
                controller: passCtrl,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password')),
            ElevatedButton(
              onPressed: () => auth.signInWithEmailAndPassword(
                email: emailCtrl.text.trim(),
                password: passCtrl.text.trim(),
              ),
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => auth.createUserWithEmailAndPassword(
                email: emailCtrl.text.trim(),
                password: passCtrl.text.trim(),
              ),
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
