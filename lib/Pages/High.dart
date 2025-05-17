import 'package:flutter/material.dart';

class High extends StatelessWidget {
  const High({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('High Mode'), centerTitle: true),
      body: const Center(
        child: Text("so you're high my friend", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
