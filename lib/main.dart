import 'package:flutter/material.dart';
import './main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '808',
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: MainScreen()),
    );
  }
}
