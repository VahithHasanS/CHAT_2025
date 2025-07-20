// ignore_for_file: unused_import, depend_on_referenced_packages

//import 'package:chat_app/app/app.dart';
import 'package:chat_application_2025/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}
