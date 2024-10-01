import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/task_model.dart';
import '../services/todo_hive_service.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  // Fetch all todos
  Future<void> fetchTodos() async {
    try {
      final todos = await TodoService.getTodos();
      state = todos; // Set state directly to the list of todos
    } catch (error) {
      // Handle errors (optionally log or throw further)
      log('Error fetching todos: $error');
    }
  }

  // Add a new todo
  Future<void> addTodo(Todo todo) async {
    try {
      await TodoService.addTodo(todo);
      await fetchTodos(); // Refresh todos after adding
    } catch (error) {
      log('Error adding todo: $error');
    }
  }

  // Delete a todo by index
  Future<void> deleteTodo(int key) async {
    try {
      await TodoService.deleteTodo(key);
      await fetchTodos(); // Refresh todos after deleting
    } catch (error) {
      log('Error deleting todo: $error');
    }
  }

  // Update a todo at a specific index
  Future<void> toggleCompleted(Todo todo) async {
    try {
      final isCompleted = !todo.isCompleted;
      final updatedTodo = todo.copyWith(isCompleted: isCompleted);
      await TodoService.updateTodo(todo.key, updatedTodo);
      await fetchTodos(); // Refresh todos after updating
    } catch (error) {
      log('Error updating todo: $error');
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await TodoService.updateTodo(todo.key, todo);
      await fetchTodos(); // Refresh todos after updating
    } catch (error) {
      log('Error updating todo: $error');
    }
  }

  Future<void> addAt(int index, Todo todo) async {
    try {
      await TodoService.reAddTodo(index, todo);
      await fetchTodos(); // Refresh todos after updating
    } catch (error) {
      log('Error updating todo: $error');
    }
  }
}

// Riverpod provider for TodoNotifier
final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier()..fetchTodos();
});
