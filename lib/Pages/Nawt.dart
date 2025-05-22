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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TodoPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Setup visit location",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ToVisit()),
                );
              },
            ),
            const SizedBox(height: 12),
            buildTileButton(
              context,
              //icon: Icons.info,
              label: "Set Playlist",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SetPlaylist()),
                );
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
  State<DetailCard> createState() => _DetailCardState(); // pointing towards class which handles logic and ui
}

class _DetailCardState extends State<DetailCard> {
  final TextEditingController nameController =
      TextEditingController(); // text fields
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
      appBar: AppBar(title: const Text("Location Form")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            CoordinateCard(),
            SizedBox(height: 20),
            const Text("or", style: TextStyle(fontSize: 20)),
            CurrentLocationCard(),
          ],
        ),
      ),
    );
  }
}

class CoordinateCard extends StatefulWidget {
  const CoordinateCard({super.key});

  @override
  State<CoordinateCard> createState() => _CoordinateCardState();
}

class _CoordinateCardState extends State<CoordinateCard> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Enter Coordinates",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: latController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Latitude",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: longController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Longitude",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentLocationCard extends StatelessWidget {
  const CurrentLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Mark Your Current Location",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Add location logic
              },
              icon: const Icon(Icons.location_on),
              label: const Text("Mark My Current Location"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ToDo list setup

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

// final keyword is used to those elements which won't be changed afterwards
// so difference between final and const is that const is compile-time constant where as final is run-time constant

class _TodoPageState extends State<TodoPage> {
  final List<String> todos = []; // list of todo items
  final TextEditingController todoController = TextEditingController();

  void addTodo() {
    final text = todoController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        todos.add(text);
      });
      todoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: todoController,
              decoration: const InputDecoration(
                labelText: 'Enter todo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: addTodo, child: const Text("Add Todo")),
            const SizedBox(height: 20),
            Expanded(
              child:
                  todos.isEmpty
                      ? const Center(child: Text("No todos yet"))
                      : ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(todos[index]),
                              trailing: IconButton(
                                icon: const Icon(Icons.close),
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    todos.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

// setup visit location

class ToVisit extends StatelessWidget {
  const ToVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Form")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            const Text("Enter 1st Location"),
            CoordinateCardToVisit(),
            SizedBox(height: 20),
            const Text("Enter 2nd Location"),
            CoordinateCardToVisit(),
          ],
        ),
      ),
    );
  }
}

class CoordinateCardToVisit extends StatefulWidget {
  const CoordinateCardToVisit({super.key});

  @override
  State<CoordinateCardToVisit> createState() => _CoordinateCardStateToVisit();
}

class _CoordinateCardStateToVisit extends State<CoordinateCardToVisit> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Enter Coordinates",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: latController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Latitude",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: longController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Longitude",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Playlist setup

class SetPlaylist extends StatelessWidget {
  const SetPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Form")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            const Text("Enter 1st Playlist"),
            PlaylistCard(),
            SizedBox(height: 20),
            const Text("Enter 2nd Playlist"),
            PlaylistCard(),
          ],
        ),
      ),
    );
  }
}

class PlaylistCard extends StatefulWidget {
  const PlaylistCard({super.key});

  @override
  State<PlaylistCard> createState() => _PlaylistCard();
}

class _PlaylistCard extends State<PlaylistCard> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Playlist",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: latController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: longController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Link",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
