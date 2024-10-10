import 'package:ai_project/Chat_inter_home%20(1).dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ai Interview",
      home: ChatInterHome(),
    );
  }
}
