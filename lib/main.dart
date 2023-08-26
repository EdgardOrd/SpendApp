import 'package:flutter/material.dart';
import 'package:proyecto/screens/add.dart';
import 'package:proyecto/widgets/bottom_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import '/firebase_options.dart';
import 'package:proyecto/screens/login_page.dart';
import 'package:proyecto/screens/update.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Sistemas Expertos',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/page': (context) => const Bottom(),
        '/add': (context) => const Add_Screen(),
        '/edit': (context) => const Update_Screen()
      },
    );
  }
}
