import 'dart:ui';
import 'package:a_safe_place/authentication/login_page.dart';
import 'package:a_safe_place/features/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest);
  runApp(const MyApp());
}

// final dummySnapshot = [
//   {
// {"Event Name": "Star Gazing"},
//   {"Event Name": "Back-flip Practice"},
//   {"Event Name": "Cooking Classes"},
//   {"Event Name": "Sleep"},
// ];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A Safe Place',
      home: SplashScreen(child: LoginPage()),
    );
  }
}
