import 'package:flutter/material.dart';

Future<TimeOfDay?> getTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (picked != null) {
    return picked;
  }

  return null;
}
