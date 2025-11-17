import 'package:flutter/material.dart';
import 'bottom_items.dart'; // Import your bottom navigation file

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
      home: const BottomNavController(), // Use the widget from bottom_items.dart
    );
  }
}
