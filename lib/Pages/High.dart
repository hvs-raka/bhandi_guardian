import 'package:bhandi_guardian/db_model/Todo_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart'; // For calling functionality
import 'package:geolocator/geolocator.dart';

class High extends StatelessWidget {
  const High({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBox = Hive.box<Todo_Model>('todos');
    final todos =
        todoBox.values
            .toList()
            .asMap()
            .entries
            .map((entry) => '${entry.key + 1}. ${entry.value.Todo}')
            .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('High Mode'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/'); // or context.pop() for go_router
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add your SOS logic here
              print("SOS pressed!");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Red background
              shape: const CircleBorder(), // Makes it round
              padding: const EdgeInsets.all(14), // Controls size
            ),
            child: const Text(
              "SOS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TodoBox(todos: todos),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Call Guardian",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GuardianScreen()),
                );
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Get Home",
              onTap: () {
                getHomeFunction(context);
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Playlist",
              onTap: () {
                // action
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Locations to visit",
              onTap: () {
                // action
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Having BT?",
              onTap: () {
                // action
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

// button style

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

// ToDo scroll box

class TodoBox extends StatefulWidget {
  final List<String> todos;

  const TodoBox({super.key, required this.todos});

  @override
  State<TodoBox> createState() => _TodoBoxState();
}

class _TodoBoxState extends State<TodoBox> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                widget.todos[index],
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Call Guardian

class GuardianScreen extends StatelessWidget {
  const GuardianScreen({super.key});

  Future<void> _callGuardian(String number) async {
    final Uri callUri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch $number';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Box<GuardianList> guardianBox = Hive.box<GuardianList>(
      'GuardianList',
    );
    final guardians = guardianBox.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Call Guardian')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: guardians.length,
        itemBuilder: (context, index) {
          final guardian = guardians[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: ListTile(
              title: Text(guardian.guardianName),
              subtitle: Text(guardian.guardianNumber.toString()),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: Colors.green),
                onPressed:
                    () => _callGuardian(guardian.guardianNumber.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Function for starting live location to home

Future<void> getHomeFunction(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );

  try {
    final Box<HomeLocation> homeBox = Hive.box<HomeLocation>('HomeLocation');

    if (homeBox.isEmpty) {
      Navigator.pop(context); // Close loading
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Home location not set')));
      return;
    }

    final home = homeBox.getAt(0);

    if (home == null) {
      Navigator.pop(context); // Close loading
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Home location data missing')),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Navigator.pop(context); // Close loading
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission denied')),
      );
      return;
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final Uri googleMapsUri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&origin=${position.latitude},${position.longitude}&destination=${home.latitude},${home.longitude}&travelmode=driving',
    );

    await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Failed to open navigation')));
  } finally {
    Navigator.pop(context); // Ensure loading closes
  }
}
