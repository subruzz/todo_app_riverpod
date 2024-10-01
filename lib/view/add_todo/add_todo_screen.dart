import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/model/task_model.dart';
import 'package:flutter_todo_riverpod/providers/date_time_providers.dart';
import 'package:flutter_todo_riverpod/utils/common_widgets/custom_button.dart';
import 'package:flutter_todo_riverpod/utils/common_widgets/custom_text_field.dart';
import 'package:flutter_todo_riverpod/utils/common_widgets/gradient_scaffold.dart';
import 'package:flutter_todo_riverpod/utils/extensions/date_formatter.dart';
import 'package:flutter_todo_riverpod/utils/helper_functions/pick_date.dart';
import 'package:flutter_todo_riverpod/utils/helper_functions/pick_time.dart';

import '../../providers/task_item_provier.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({super.key});

  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final _taskTitleController = TextEditingController();
  final _descController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Todo'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Task Title',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          hintText: 'Task Title',
                          controller: _taskTitleController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Task Title';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Consumer(
                                    builder: (context, ref, child) {
                                      final dateRef = ref.watch(dateProvider);
                                      return CustomTextField(
                                        onSuffixIconPressed: () async {
                                          final date = await getDate(context);
                                          if (date != null) {
                                            ref
                                                .read(dateProvider.notifier)
                                                .state = date;
                                          }
                                        },
                                        readOnly: true,
                                        hintText:
                                            dateRef.toCustomFormat() ,
                                        suffixIcon: const Icon(
                                          Icons.calendar_month,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Time',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Consumer(
                                    builder: (context, ref, child) {
                                      final timeRef = ref.watch(timeProvider);
                                      return CustomTextField(
                                        onSuffixIconPressed: () async {
                                          final time = await getTime(context);
                                          if (time != null) {
                                            ref
                                                .read(timeProvider.notifier)
                                                .state = time;
                                          }
                                        },
                                        readOnly: true,
                                        hintText:
                                            timeRef?.format(context) ?? 'Time',
                                        suffixIcon: const Icon(
                                          Icons.timer,
                                        ),
                                      );
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text('Notify'),
                                      Consumer(
                                        builder: (context, ref, child) {
                                          final shouldNotifyRef =
                                              ref.watch(shouldNotifyProvider);
                                          return Checkbox(
                                            value: shouldNotifyRef,
                                            onChanged: (val) {
                                              ref
                                                  .read(shouldNotifyProvider
                                                      .notifier)
                                                  .state = val ?? false;
                                            },
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              controller: _descController,
                              hintText: 'Description',
                              minLines: 3,
                              maxLines: 6,
                              // No validation for description
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomButton(
                      width: double.infinity,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final todo = Todo(
                            title: _taskTitleController.text.trim(),
                            description: _descController.text.trim(),
                            date: ref.read(dateProvider),
                            time: ref.read(timeProvider),
                            shouldNotify: ref.read(shouldNotifyProvider),
                          );
                          ref.read(todoProvider.notifier).addTodo(todo);
                          Navigator.of(context).pop();
                        }
                      },
                      text: 'Save',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
