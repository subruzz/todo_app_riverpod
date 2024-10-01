
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/utils/common_widgets/gradient_scaffold.dart';
import 'package:flutter_todo_riverpod/view/add_todo/add_todo_screen.dart';
import 'package:flutter_todo_riverpod/view/home/widgets/all_todo_list.dart';
import 'package:flutter_todo_riverpod/view/home/widgets/progress_card.dart';
import 'package:flutter_todo_riverpod/view/home/widgets/tab_button.dart';

import '../../providers/todo_filter_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddTodoScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SizedBox(height: 10), ProgressCard()],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    TabButton(todoFilter: TodoFilter.today),
                    TabButton(todoFilter: TodoFilter.all),
                    TabButton(todoFilter: TodoFilter.inProgress),
                    TabButton(todoFilter: TodoFilter.completed)
                  ],
                ),
              ),
              const AllTodoList(),
            ],
          ),
        ),
      ),
    );
  }
}

