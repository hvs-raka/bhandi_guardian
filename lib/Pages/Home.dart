// File: lib/pages/home.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // importing material design packages
//import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is the basic Material Design layout structure
    return Scaffold(
      appBar: AppBar(
        title: const Text('High! Help?'),
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
              },
              child: Text('yeah, High'),
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 2),
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: const Size(150, 60),
              ),
            ),
            const Text("or", style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                context.go('/Nawt');
              },
              child: Text("nahh, I'm Nawt"),
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 2),
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: const Size(150, 60),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Developed by ',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextSpan(
                    text: 'Raka',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap =
                              () => launchUrlString(
                                'https://hvs-raka.github.io/Raka/',
                              ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
