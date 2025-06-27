import 'package:hive/hive.dart';
part 'Todo_model.g.dart';

@HiveType(typeId: 0)
class Todo_Model extends HiveObject {
  @HiveField(0)
  String Todo;

  Todo_Model({required this.Todo});
}
