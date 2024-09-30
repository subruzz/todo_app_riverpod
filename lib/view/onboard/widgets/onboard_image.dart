import 'package:flutter/material.dart';

import '../../../utils/const/assets.dart';


class OnboardImage extends StatelessWidget {
  const OnboardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          onboard,
          // Replace with your actual image asset
        ),
      ),
    );
  }
}
