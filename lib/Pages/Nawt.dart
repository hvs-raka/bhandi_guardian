//import 'dart:async';

import 'package:bhandi_guardian/utils/debouncer.dart';
import 'package:bhandi_guardian/boxes/boxes.dart';
import 'package:bhandi_guardian/db_model/Todo_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

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
                  MaterialPageRoute(
                    builder: (_) => const ToVisit(visitIndex: 0),
                  ),
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
  final debouncer = Debouncer(delay: const Duration(milliseconds: 800));
  late Box<GuardianList> guardianlistBox;

  /*
  @override
  void initState() {
    super.initState();
    guardianlistBox = Hive.box<GuardianList>('GuardianList');

    final guardianlist = guardianlistBox.isNotEmpty ? guardianlistBox.getAt(0) : null;

    if (guardianlist != null) {
      nameController.text = guardianlist.guardianName;
      numberController.text = guardianlist?.guardianNumber.toString() ?? '';
      // set for button too
    }
  }

  // set for button too
  void _saveGuardianListData() {
    final name = nameController.text.trim();
    final number = int.tryParse(numberController.text.trim()) ?? 0;

    if (name.isEmpty || number.isEmpty) return;

    if (guardianlistBox.isEmpty) {
      guardianlistBox.add(PlayList(guardianName: name, guardianNumber: link));
    } else {
      final guardianlist = guardianlistBox.getAt(0);
      if (guardianlist != null) {
        guardianlist.guardianName = name;
        guardianlist.guardianLink = number;
        guardianlist.save();
      }
    }
  }
  */

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
  //final List<String> todos = []; // list of todo items
  final todoController = TextEditingController();
  final todoBox = Hive.box<Todo_Model>('todos');
  /*void addTodo() {
    final text = Todo_Model(
      Todo: todoController.text,
    ); //todoController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        todos.add(text);
      });
      todoController.clear();
    }
  }*/

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
            ElevatedButton(
              onPressed: () {
                final text = Todo_Model(Todo: todoController.text);
                final box = Boxes.getData();
                box.add(text);
                text.save();
                todoController.clear();
              },
              child: const Text("Add Todo"),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ValueListenableBuilder(
                valueListenable: todoBox.listenable(),
                builder: (context, Box<Todo_Model> box, _) {
                  if (box.isEmpty) {
                    return const Center(child: Text("No todos yet"));
                  }

                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final todo = box.getAt(index);
                      if (todo == null) return const SizedBox();

                      return Card(
                        child: ListTile(
                          title: Text(
                            todo.Todo,
                          ), // assuming 'Todo' is a field in Todo_Model
                          trailing: IconButton(
                            icon: const Icon(Icons.close),
                            color: Colors.red,
                            onPressed: () {
                              box.deleteAt(
                                index,
                              ); // no need to call setState, listenable handles it
                            },
                          ),
                        ),
                      );
                    },
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

// setting up debounce (so that on change don't store very key stroke instead only store when user is stopped writing)
// in util now

// setup visit location

class ToVisit extends StatelessWidget {
  final int visitIndex;
  const ToVisit({super.key, required this.visitIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Form")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            const Text("Enter 1st Location"),
            CoordinateCardToVisit(visitIndex: 0),
            SizedBox(height: 20),
            const Text("Enter 2nd Location"),
            CoordinateCardToVisit(visitIndex: 1),
          ],
        ),
      ),
    );
  }
}

class CoordinateCardToVisit extends StatefulWidget {
  const CoordinateCardToVisit({super.key, required int visitIndex});

  @override
  State<CoordinateCardToVisit> createState() => _CoordinateCardStateToVisit();
}

class _CoordinateCardStateToVisit extends State<CoordinateCardToVisit> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final debouncer = Debouncer(delay: const Duration(milliseconds: 800));
  late Box<Visit_List> visitBox;
  int currentVisitIndex = 0;

  @override
  void initState() {
    super.initState();
    visitBox = Hive.box<Visit_List>('Visit_List');

    if (visitBox.length > currentVisitIndex) {
      final visit = visitBox.getAt(0);
      latController.text = visit?.latitude.toString() ?? '';
      longController.text = visit?.longitude.toString() ?? '';
      placeController.text = visit?.placeName ?? '';
    }
  }

  void _saveVisitData() {
    final lat = double.tryParse(latController.text.trim()) ?? 0;
    final long = double.tryParse(longController.text.trim()) ?? 0;
    final place = placeController.text.trim();

    if (place.isEmpty || lat == 0 || long == 0) return;

    final visit = Visit_List(latitude: lat, longitude: long, placeName: place);

    if (visitBox.length > currentVisitIndex) {
      visitBox.putAt(currentVisitIndex, visit); // update specific entry
    } else {
      visitBox.add(visit); // add new
    }
  }

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
              onTap: () => latController.clear(),
              onChanged: (_) => debouncer.run(_saveVisitData),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: longController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Longitude",
                border: OutlineInputBorder(),
              ),
              onTap: () => longController.clear(),
              onChanged: (_) => debouncer.run(_saveVisitData),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: placeController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "PlaceName",
                border: OutlineInputBorder(),
              ),
              onTap: () => placeController.clear(),
              onChanged: (_) => debouncer.run(_saveVisitData),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    latController.dispose();
    longController.dispose();
    placeController.dispose();
    super.dispose();
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
            PlaylistCard(index: 0),
            SizedBox(height: 20),
            const Text("Enter 2nd Playlist"),
            PlaylistCard(index: 1),
          ],
        ),
      ),
    );
  }
}

class PlaylistCard extends StatefulWidget {
  final int index;
  const PlaylistCard({super.key, required this.index});

  @override
  State<PlaylistCard> createState() => _PlaylistCard();
}

class _PlaylistCard extends State<PlaylistCard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final debouncer = Debouncer(delay: const Duration(milliseconds: 800));
  late Box<PlayList> playlistBox;

  @override
  void initState() {
    super.initState();
    playlistBox = Hive.box<PlayList>('PlayList');

    // Use the passed index to fetch correct playlist
    final playlist =
        playlistBox.length > widget.index
            ? playlistBox.getAt(widget.index)
            : null;

    if (playlist != null) {
      nameController.text = playlist.playlistName;
      linkController.text = playlist.playlistLink;
    }
  }

  void _savePlayListData() {
    final name = nameController.text.trim();
    final link = linkController.text.trim();

    if (name.isEmpty || link.isEmpty) return;

    if (playlistBox.length > widget.index) {
      // Update existing playlist at index
      final playlist = playlistBox.getAt(widget.index);
      if (playlist != null) {
        playlist.playlistName = name;
        playlist.playlistLink = link;
        playlist.save();
      }
    } else {
      // Add new playlist at the end until desired index - if needed pad first
      // but usually you'll be adding sequentially, so we check:
      if (widget.index == playlistBox.length) {
        playlistBox.add(PlayList(playlistName: name, playlistLink: link));
      } else {
        // If somehow the indexes are not sequential, you can override:
        playlistBox.putAt(
          widget.index,
          PlayList(playlistName: name, playlistLink: link),
        );
      }
    }
  }

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
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              onTap: () => nameController.clear(),
              onChanged: (_) => debouncer.run(_savePlayListData),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: linkController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Link",
                border: OutlineInputBorder(),
              ),
              onTap: () => linkController.clear(),
              onChanged: (_) => debouncer.run(_savePlayListData),
            ),
          ],
        ),
      ),
    );
  }
}
