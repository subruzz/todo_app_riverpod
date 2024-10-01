import 'package:flutter/material.dart';

import '../../../utils/const/assets.dart';

class NoTodoHolder extends StatelessWidget {
  const NoTodoHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            empty,
            width: 170,
          ),
          const Text(
            'No Tasks Available',
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
