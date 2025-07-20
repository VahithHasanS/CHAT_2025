// ignore_for_file: prefer_const_constructors

//import 'package:chat_app/core/provider.dart';
//import 'package:chat_app/features/auth/auth_screen.dart';
//import 'package:chat_app/features/chat/chat_screen.dart';
import 'package:chat_application_2025/core/provider.dart';
import 'package:chat_application_2025/features/auth/auth_screen.dart';
import 'package:chat_application_2025/features/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'features/auth/auth_screen.dart';
//import 'features/chat/chat_screen.dart';
//import 'core/providers.dart';

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);

    return MaterialApp(
      home: user.when(
        data: (user) => user != null ? ChatScreen() : AuthScreen(),
        loading: () => CircularProgressIndicator(),
        error: (_, __) => Text('Error'),
      ),
    );
  }
}
