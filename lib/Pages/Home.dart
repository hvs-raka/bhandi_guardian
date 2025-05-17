// File: lib/pages/home.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // importing material design packages

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is the basic Material Design layout structure
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bhandi Guardian'),
        backgroundColor:
            Theme.of(context)
                .colorScheme
                .inversePrimary, // using complementary color to the primary color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Are you High my friend?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // if routes are set use this bellow command to navigate between pages
                context.go('/High');
                print("high");
              },
              child: Text('High'),
            ),
            const Text("or"),
            ElevatedButton(
              onPressed: () {
                context.go('/Nawt');
                print("Nawt");
              },
              child: Text('Nawt'),
            ),
            const SizedBox(height: 20),
            const Text('Developed by me ^ ^', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
