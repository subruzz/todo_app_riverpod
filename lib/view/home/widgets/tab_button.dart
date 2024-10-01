import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/utils/const/colors.dart';

import '../../../providers/todo_filter_provider.dart';

class TabButton extends ConsumerWidget {
  const TabButton({super.key, required this.todoFilter});
  final TodoFilter todoFilter;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterRef = ref.watch(todoFilterType);
    return GestureDetector(
      onTap: () {
        ref.read(todoFilterType.notifier).state = todoFilter;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: filterRef == todoFilter ? primaryColor : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            todoFilter == TodoFilter.all
                ? 'All Tasks'
                : todoFilter == TodoFilter.completed
                    ? 'Completed'
                    : todoFilter == TodoFilter.today
                        ? 'Today Tasks'
                        : 'In Progress',
            style: TextStyle(
                fontSize: 15,
                color: filterRef == todoFilter ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
