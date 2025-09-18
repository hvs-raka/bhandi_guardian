import 'package:bhandi_guardian/db_model/Todo_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart'; // For calling functionality
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PlaylistWidget()),
                );
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Locations to visit",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const VisitLocationsWidget(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Having BT?",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HarmReductionTips()),
                );
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

// Playlist

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final playlistBox = Hive.box<PlayList>('PlayList');

    return Scaffold(
      appBar: AppBar(title: const Text("🎶 Playlists"), centerTitle: true),
      body: ValueListenableBuilder(
        valueListenable: playlistBox.listenable(),
        builder: (context, Box<PlayList> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text(
                "No playlists saved.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final playlists = box.values.toList();

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  title: Text(
                    playlist.playlistName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: ElevatedButton.icon(
                    onPressed: () => _launchUrl(playlist.playlistLink),
                    icon: const Icon(Icons.play_arrow, color: Colors.white),
                    label: const Text("Play"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Visit Location

class VisitLocationsWidget extends StatelessWidget {
  const VisitLocationsWidget({super.key});

  Future<void> _navigateToLocation(double lat, double lng) async {
    final Uri googleMapsUrl = Uri.parse(
      "https://www.google.com/maps/dir/?api=1&destination=$lat,$lng&travelmode=driving",
    );

    if (!await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch Google Maps");
    }
  }

  @override
  Widget build(BuildContext context) {
    final visitBox = Hive.box<Visit_List>('Visit_List');

    return Scaffold(
      appBar: AppBar(
        title: const Text("📍 Visit Locations"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: visitBox.listenable(),
        builder: (context, Box<Visit_List> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text(
                "No visit locations saved.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final visits = box.values.toList().take(2).toList(); // take only 2

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: visits.length,
            itemBuilder: (context, index) {
              final location = visits[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  title: Text(
                    location.placeName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: ElevatedButton.icon(
                    onPressed:
                        () => _navigateToLocation(
                          location.latitude,
                          location.longitude,
                        ),
                    icon: const Icon(Icons.navigation, color: Colors.white),
                    label: const Text("Navigate"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Having BT widget

class HarmReductionTips extends StatelessWidget {
  const HarmReductionTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Harm Reduction Tips"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: "🌿 Too High on Weed (Bad Trip / BT)",
            tips: [
              "Stay calm & safe → Reassure, quiet environment.",
              "Hydrate → Small sips of water or electrolyte drink.",
              "Sugar helps → Sweet drink (juice, soda) can reduce intensity.",
              "Black pepper → Smelling or chewing a few black peppercorns may ease anxiety.",
              "Fresh air → Cool, ventilated space.",
              "Rest → Lie down, close eyes, slow breathing.",
              "Take a shower or wash your face → Helps reset body & mind.",
            ],
            color: Colors.green[100]!,
          ),
          const SizedBox(height: 16),
          _buildSection(
            title: "🍺 Too Drunk (Alcohol Overdose Signs)",
            tips: [
              "Stop drinking immediately.",
              "Hydrate → Water or electrolyte drink (avoid coffee).",
              "Food → Light snack to slow absorption.",
              "Do NOT make them vomit if very drunk (risk of choking).",
              "Lay on their side if unconscious → recovery position.",
              "Seek emergency help if: vomiting nonstop, slow breathing, unconscious, or skin turns blue/pale.",
            ],
            color: Colors.red[100]!,
          ),
          const SizedBox(height: 16),
          _buildSection(
            title: "🚬 Nicotine (Too Much Smoking/Vaping)",
            tips: [
              "Sit or lie down, sip water, and take deep breaths.",
              "Chew gum or eat something light.",
              "Fresh air helps dizziness/nausea.",
              "Rest until the symptoms fade.",
            ],
            color: Colors.blue[100]!,
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> tips,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            ...tips.map(
              (tip) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "• ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Expanded(
                      child: Text(
                        tip,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
