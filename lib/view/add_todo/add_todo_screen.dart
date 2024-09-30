import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/utils/common_widgets/custom_button.dart';
import 'package:flutter_todo_riverpod/utils/common_widgets/custom_text_field.dart';
import 'package:flutter_todo_riverpod/utils/common_widgets/gradient_scaffold.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

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
                        const CustomTextField(hintText: 'Task Title'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomTextField(
                                  hintText: 'Date',
                                  suffixIcon: Icon(
                                    Icons.calendar_month,
                                  ),
                                ),
                              ],
                            )),
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
                                const CustomTextField(
                                  hintText: 'Task Title',
                                  suffixIcon: Icon(
                                    Icons.timer,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text('Notify'),
                                    Checkbox(value: true, onChanged: (val) {})
                                  ],
                                )
                              ],
                            )),
                          ],
                        ),
                        
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              hintText: 'Description',
                              minLines: 3,
                              maxLines: 6,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomButton(
                        width: double.infinity, onPressed: () {}, text: 'Save')
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
