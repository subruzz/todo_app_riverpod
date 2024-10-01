import 'package:hive/hive.dart';
import '../model/task_model.dart';

class TodoService {
  static Box<Todo> box = Hive.box<Todo>('todos');

  // Add a new todo
  static Future<void> addTodo(Todo todo) async {
    await box.add(todo);
    // No need to close the box here
  }

  static Future<void> reAddTodo(int index, Todo todo) async {
    await box.putAt(index, todo);
    // No need to close the box here
  }

  // Get the list of todos
  static Future<List<Todo>> getTodos() async {
    // Convert values to a List<Todo> and return
    return box.values.toList().cast<Todo>();
  }

  // Delete a todo by index
  static Future<void> deleteTodo(int key) async {
    await box.delete(key);
    // No need to close the box here
  }

  // Optional: Update a todo at a specific index
  static Future<void> updateTodo(int key, Todo updatedTodo) async {
    await box.put(key, updatedTodo);
  }
}
