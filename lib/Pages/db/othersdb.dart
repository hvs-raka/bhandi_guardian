import 'package:isar/isar.dart';

part 'othersdb.g.dart';

@Collection()
class othersdb {
  Id others_id = Isar.autoIncrement;
  late VisitLocation visitLocation;
  List<Playlists> Playlist = [];
  late String SOSsettings;
}

@embedded
class VisitLocation {
  late double latitude;
  late double longitude;
}

@embedded
class Playlists {
  late String name;
  late String link;
}
