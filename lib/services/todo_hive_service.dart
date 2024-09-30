import 'package:hive/hive.dart';

import '../model/task_model.dart';

class TodoService {
  final String boxName = 'todos';

  Future<void> addTodo(Todo todo) async {
    var box = await Hive.openBox<Todo>(boxName);
    await box.add(todo);
    await box.close();
  }

  Future<List<Todo>> getTodos() async {
    var box = await Hive.openBox<Todo>(boxName);
    List<Todo> todos = box.values.toList();
    await box.close();
    return todos;
  }

  Future<void> deleteTodo(int index) async {
    var box = await Hive.openBox<Todo>(boxName);
    await box.deleteAt(index);
    await box.close();
  }
}
