import 'package:isar/isar.dart';

part 'helpsdb.g.dart';

@Collection()
class helpsdb {
  Id helps_id = Isar.autoIncrement;
  // list for guardians
  List<Guardian> guardians = [];

  // home location
  late HomeLocation homeLocation;
}

@embedded
class Guardian {
  late String name;
  late String number;
}

@embedded
class HomeLocation {
  late double latitude;
  late double longitude;
}
