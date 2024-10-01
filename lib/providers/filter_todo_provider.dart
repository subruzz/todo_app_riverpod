import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/model/task_model.dart';
import 'package:flutter_todo_riverpod/providers/task_item_provier.dart';
import 'package:flutter_todo_riverpod/providers/todo_filter_provider.dart';
import 'package:flutter_todo_riverpod/utils/extensions/today_date_checker.dart';

final filterTodoProvider = Provider<List<Todo>>((ref) {
  final filterAdded = ref.watch(todoFilterType);
  final todos = ref.watch(todoProvider);
  switch (filterAdded) {
    case TodoFilter.all:
      return todos;
    case TodoFilter.completed:
      return todos.where((todo) => todo.isCompleted).toList();
    case TodoFilter.inProgress:
      return todos.where((todo) => !todo.isCompleted).toList();
    case TodoFilter.today:
      return todos
          .where((todo) => todo.date != null && todo.date!.isToday())
          .toList();
  }
});
