import 'package:flutter/material.dart';
import 'visiting_card_screen.dart';

void main() {
  runApp(const VisitingCardApp());
}

class VisitingCardApp extends StatelessWidget {
  const VisitingCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Visiting Card',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7138C8),
        ),
      ),
      home: const VisitingCardScreen(),
    );
  }
}