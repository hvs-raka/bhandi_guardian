import 'package:hive/hive.dart';
import 'package:bhandi_guardian/db_model/Todo_model.dart';

class Boxes {
  static Box<Todo_Model> getData() => Hive.box<Todo_Model>('Todos');
}
