//import 'dart:async';

import 'package:bhandi_guardian/utils/debouncer.dart';
import 'package:bhandi_guardian/boxes/boxes.dart';
import 'package:bhandi_guardian/db_model/Todo_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SosSettings()),
                );
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
            DetailCard(guardianIndex: 0),
            SizedBox(height: 18),
            DetailCard(guardianIndex: 1),
            SizedBox(height: 18),
            DetailCard(guardianIndex: 2),
          ],
        ),
      ),
    );
  }
}

class DetailCard extends StatefulWidget {
  final int guardianIndex;
  const DetailCard({super.key, required this.guardianIndex});

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

  @override
  void initState() {
    super.initState();
    guardianlistBox = Hive.box<GuardianList>('GuardianList');
    final guardianlist =
        guardianlistBox.length > widget.guardianIndex
            ? guardianlistBox.getAt(widget.guardianIndex)
            : null;
    if (guardianlist != null) {
      nameController.text = guardianlist.guardianName;
      numberController.text = guardianlist.guardianNumber.toString();
      isEnabled = guardianlist.button;
    }
  }

  void _saveGuardianData() {
    final name = nameController.text.trim();
    final number = int.tryParse(numberController.text.trim()) ?? 0;

    if (name.isEmpty || number == 0) return;

    final guardian = GuardianList(
      guardianName: name,
      guardianNumber: number,
      button: isEnabled,
    );

    if (guardianlistBox.length > widget.guardianIndex) {
      guardianlistBox.putAt(widget.guardianIndex, guardian);
    } else {
      guardianlistBox.add(guardian);
    }
  }

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
                  _saveGuardianData();
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
            //CurrentLocationCard(),
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
  late final Box<HomeLocation> homeBox;

  @override
  void initState() {
    super.initState();
    homeBox = Hive.box<HomeLocation>('HomeLocation');

    if (homeBox.isNotEmpty) {
      final home = homeBox.getAt(0);
      latController.text = home?.latitude.toString() ?? '';
      longController.text = home?.longitude.toString() ?? '';
    }
  }

  Future<bool> _handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied again
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      return false;
    }
    return true;
  }

  Future<void> _getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permissions are denied')),
      );
      return;
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // update fields in THIS parent
    latController.text = position.latitude.toString();
    longController.text = position.longitude.toString();

    _saveHomeLocation(); // then save
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Home location saved')));
  }

  void _saveHomeLocation() {
    final lat = double.tryParse(latController.text.trim()) ?? 0;
    final long = double.tryParse(longController.text.trim()) ?? 0;
    if (lat == 0 || long == 0) return;

    final home = HomeLocation(latitude: lat, longitude: long);

    if (homeBox.isNotEmpty) {
      homeBox.putAt(0, home); // update the single record
    } else {
      homeBox.add(home); // first time
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
            const SizedBox(height: 16),

            // ⬇️ Use the child and PASS the callback
            CurrentLocationCard(onSave: _getCurrentLocation),
          ],
        ),
      ),
    );
  }
}

class CurrentLocationCard extends StatelessWidget {
  final VoidCallback onSave;
  const CurrentLocationCard({super.key, required this.onSave});

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
              onPressed: onSave,
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
  final int visitIndex;
  const CoordinateCardToVisit({super.key, required this.visitIndex});

  @override
  State<CoordinateCardToVisit> createState() => _CoordinateCardStateToVisit();
}

class _CoordinateCardStateToVisit extends State<CoordinateCardToVisit> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final debouncer = Debouncer(delay: const Duration(milliseconds: 800));
  late Box<Visit_List> visitBox;

  @override
  void initState() {
    super.initState();
    visitBox = Hive.box<Visit_List>('Visit_List');

    final visitLocation =
        visitBox.length > widget.visitIndex
            ? visitBox.getAt(widget.visitIndex)
            : null;

    if (visitLocation != null) {
      latController.text = visitLocation.latitude.toString();
      longController.text = visitLocation.longitude.toString();
      placeController.text = visitLocation.placeName;
    }
  }

  void _saveVisitData() {
    final lat = double.tryParse(latController.text.trim()) ?? 0;
    final long = double.tryParse(longController.text.trim()) ?? 0;
    final place = placeController.text.trim();

    if (place.isEmpty || lat == 0 || long == 0) return;

    final visit = Visit_List(latitude: lat, longitude: long, placeName: place);

    if (visitBox.length > widget.visitIndex) {
      visitBox.putAt(
        widget.visitIndex,
        visit,
      ); // update existing record at correct index
    } else {
      // Add new record only if index matches length (i.e., sequential additions)
      if (widget.visitIndex == visitBox.length) {
        visitBox.add(visit);
      } else {
        // If indexes are non-sequential, might want to handle differently or throw error
        visitBox.putAt(widget.visitIndex, visit);
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

// SOS Settings

class SosSettings extends StatefulWidget {
  const SosSettings({super.key});

  @override
  State<SosSettings> createState() => _SosStateCard();
}

class _SosStateCard extends State<SosSettings> {
  late Box<SosSettingsModel> sosBox;
  late TextEditingController sosNumberController;
  late TextEditingController sosMessageController;
  late SosSettingsModel settings;

  @override
  void initState() {
    super.initState();

    sosBox = Hive.box<SosSettingsModel>('sosSettings');

    sosNumberController = TextEditingController();
    sosMessageController = TextEditingController();

    if (sosBox.isEmpty) {
      settings = SosSettingsModel(
        guardianEnabled: false,
        homeLocationEnabled: false,
        sosMessageEnabled: false,
        SOSmessage: '',
        SOSnumber: '',
      );
      sosBox.add(settings);
    } else {
      settings = sosBox.getAt(0)!;
      sosNumberController.text = settings.SOSnumber;
      sosMessageController.text = settings.SOSmessage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SOS Settings"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Configure SOS Options",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Guardian Contacts
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.contacts, color: Colors.red),
              title: const Text("Guardian Contacts"),
              subtitle: const Text("1st Guardian will be called"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Switch(
                    value: settings.guardianEnabled,
                    onChanged: (value) {
                      setState(() {
                        settings.guardianEnabled = value;
                        settings.save(); // Saves to Hive
                      });
                    },
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: settings.guardianEnabled ? Colors.blue : Colors.grey,
                  ),
                ],
              ),
              onTap: () {
                if (settings.guardianEnabled) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const GuardianSetup()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Turn it on first...')),
                  );
                }
              },
            ),
          ),

          const SizedBox(height: 12),

          // Home Location
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text("Home Location"),
              subtitle: const Text("Set or update your home location"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Switch(
                    value: settings.homeLocationEnabled,
                    onChanged: (value) {
                      setState(() {
                        settings.homeLocationEnabled = value;
                        settings.save(); // Saves to Hive
                      });
                    },
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color:
                        settings.homeLocationEnabled
                            ? Colors.blue
                            : Colors.grey,
                  ),
                ],
              ),
              onTap: () {
                if (settings.homeLocationEnabled) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SafeLocation()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Turn it on first...')),
                  );
                }
              },
            ),
          ),

          const SizedBox(height: 12),

          // SOS Message
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.message, color: Colors.green),
              title: const Text("SOS Message"),
              trailing: Switch(
                value: settings.sosMessageEnabled,
                onChanged: (bool value) {
                  setState(() {
                    settings.sosMessageEnabled = value;
                    settings.save(); // Saves to Hive
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 12),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SOS Contact for SMS",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: sosNumberController,
                    keyboardType: TextInputType.phone,
                    maxLines: 1, // small text box
                    decoration: const InputDecoration(
                      hintText: "Enter mobile number here...",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      settings.SOSnumber = value.trim();
                      settings.save();
                    },
                  ),
                ],
              ),
            ),
          ),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your SOS Message",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: sosMessageController,
                    maxLines: 2, // small text box
                    decoration: const InputDecoration(
                      hintText: "Enter your SOS message here...",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      settings.SOSmessage = value.trim();
                      settings.save();
                    },
                  ),
                ],
              ),
            ),
          ),
          const Text(
            "SOS settings, message will go via SMS with your current location",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
