import 'package:isar/isar.dart';

part 'todo.g.dart';

@Collection()
class Todo {
  Id Todo_id = Isar.autoIncrement;
  late String title;
  late bool isCompleted;
}
