import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/view/home/home_screen.dart';
import '../../utils/common_widgets/custom_button.dart';
import '../../utils/common_widgets/gradient_scaffold.dart';
import '../../utils/const/colors.dart';
import '../../utils/const/text_style.dart';
import 'widgets/onboard_image.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OnboardImage(),
            Text(
              'Task Management &\nTo-Do List',
              style: customTextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'This productive tool is designed to help you better manage your task project-wise conveniently.',
              style: customTextStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
              trailing: const Icon(
                Icons.arrow_forward,
                color: whiteColor,
              ),
              text: 'Let\'s Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
