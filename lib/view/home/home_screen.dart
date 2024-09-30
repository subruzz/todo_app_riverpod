import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/utils/common_widgets/custom_button.dart';
import 'package:flutter_todo_riverpod/utils/common_widgets/gradient_scaffold.dart';
import 'package:flutter_todo_riverpod/utils/const/colors.dart';
import 'package:flutter_todo_riverpod/view/add_todo/add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
            builder: (context) => AddTodoScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Good Morning!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'User',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      margin: EdgeInsets.zero,
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Your today's task",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                const Text(
                                  "almost done!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                const SizedBox(height: 12),
                                CustomButton(
                                  height: 45,
                                  onPressed: () {},
                                  text: 'View Task',
                                  textColor: primaryColor,
                                  color: whiteColor,
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircularProgressIndicator(
                                    value: 0.8, // Adjust the value as needed
                                    strokeWidth: 6,
                                    backgroundColor:
                                        Colors.white.withOpacity(0.3),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.white),
                                  ),
                                ),
                                const Text(
                                  '80%',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: primaryColor,
                ),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 15),
                unselectedLabelStyle: const TextStyle(fontSize: 15),
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'My Tasks'),
                  Tab(text: 'In-progress'),
                  Tab(text: 'Completed'),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Center(child: Text('My Tasks Content')),
                    Center(child: Text('In-progress Content')),
                    Center(child: Text('Completed Content')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
