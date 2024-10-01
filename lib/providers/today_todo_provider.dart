import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/providers/task_item_provier.dart';
import 'package:flutter_todo_riverpod/utils/extensions/today_date_checker.dart';

import '../model/task_model.dart';

// Provider for today's tasks
final todaysTodoProvider = Provider<List<Todo>>((ref) {
  final todos = ref.watch(todoProvider);
  return todos
      .where((todo) => todo.date != null && todo.date!.isToday())
      .toList();
});

// Provider for completion percentage of today's tasks
final completionPercentageProvider = Provider<double>((ref) {
  final todaysTasks = ref.watch(todaysTodoProvider);
  
  final completedCount = todaysTasks.where((todo) => todo.isCompleted).length;
  final totalCount = todaysTasks.length;

  return calculateCompletionPercentage(completedCount, totalCount);
});

// Helper method to calculate the percentage of completed tasks
double calculateCompletionPercentage(int completed, int total) {
  if (total == 0) return 0.0; // To avoid division by zero
  return (completed / total) * 100;
}
