import 'package:hive/hive.dart';
part 'Todo_model.g.dart';

@HiveType(typeId: 0)
class Todo_Model extends HiveObject {
  @HiveField(0)
  String Todo;

  Todo_Model({required this.Todo});
}

// Fun DB

@HiveType(typeId: 1)
class Visit_List extends HiveObject {
  @HiveField(0)
  double latitude;

  @HiveField(1)
  double longitude;

  @HiveField(2)
  String placeName;

  Visit_List({
    required this.latitude,
    required this.longitude,
    required this.placeName,
  });
}

@HiveType(typeId: 2)
class PlayList extends HiveObject {
  @HiveField(0)
  String playlistName;

  @HiveField(1)
  String playlistLink;

  PlayList({required this.playlistName, required this.playlistLink});
}

// Safety DB

@HiveType(typeId: 3)
class GuardianList extends HiveObject {
  @HiveField(0)
  String guardianName;

  @HiveField(1)
  int guardianNumber;

  @HiveField(3)
  bool button;

  GuardianList({
    required this.guardianName,
    required this.guardianNumber,
    required this.button,
  });
}
