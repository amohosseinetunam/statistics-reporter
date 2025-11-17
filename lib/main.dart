import 'package:flutter/material.dart';
import 'bottom_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Statistics Reporter',
      home: const BottomNavController(),
    );
  }
}
