import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Nawt extends StatelessWidget {
  const Nawt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Mode'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/'); // or context.pop() for go_router
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Setup Guardian",
              onTap: () {
                // Navigate or do something
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.details,
              label: "Home Location",
              onTap: () {
                // Navigate or do something
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Setup ToDo List",
              onTap: () {
                // Navigate or do something
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTileButton(
  BuildContext context, {
  //required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      /*leading: Icon(
        icon,
        size: 28,
        color: Theme.of(context).colorScheme.primary,
      ),*/
      title: Text(label, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    ),
  );
}
