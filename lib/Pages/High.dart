import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class High extends StatelessWidget {
  const High({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('High Mode'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/'); // or context.pop() for go_router
          },
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("so you're high my friend", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
