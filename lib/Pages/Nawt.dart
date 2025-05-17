import 'package:flutter/material.dart';

class Nawt extends StatelessWidget {
  const Nawt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Mode'), centerTitle: true),
      body: const Center(
        child: Text(
          "Here's the setting my friend",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
