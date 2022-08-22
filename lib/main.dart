import 'package:flutter/material.dart';
import 'package:flutter_360_rotation_shopping_app/screens/get_started_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GetStartedScreen(),
    );
  }
}