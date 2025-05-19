import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// main widget for nawt page

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GuardianSetup()),
                );
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.details,
              label: "Home Location",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SafeLocation()),
                );
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
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Setup visit location",
              onTap: () {
                // Navigate or do something
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Set Playlist",
              onTap: () {
                // Navigate or do something
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "SOS Settings",
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

// other widgets

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

// Guardian setup

class GuardianSetup extends StatelessWidget {
  const GuardianSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Guardians'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Nawt()),
            );
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            const Text(
              "Add your IRL guardians here, to call them on emergency.",
            ),
            DetailCard(),
            SizedBox(height: 18),
            DetailCard(),
            SizedBox(height: 18),
            DetailCard(),
          ],
        ),
      ),
    );
  }
}

class DetailCard extends StatefulWidget {
  const DetailCard({super.key});

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      //shadowColor: Colors.deepPurpleAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            //Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Switch(
                value: isEnabled,
                activeColor: Colors.blueAccent,
                inactiveThumbColor: Colors.blueGrey,
                onChanged: (value) {
                  setState(() {
                    isEnabled = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Safe location setup

class SafeLocation extends StatelessWidget {
  const SafeLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Safe Location'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Nawt()),
            );
          },
        ),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(16)),
    );
  }
}
