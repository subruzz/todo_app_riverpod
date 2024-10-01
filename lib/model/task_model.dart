import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final DateTime? date;

  @HiveField(2)
  final int? timeInMinutes; // Store time as an integer

  @HiveField(3)
  final bool shouldNotify;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final bool isCompleted; // New field to track completion

  Todo({
    required this.title,
    this.date,
    TimeOfDay? time,
    this.shouldNotify = false,
    this.description,
    this.isCompleted = false, // Default value for the new field
  }) : timeInMinutes = time != null ? time.hour * 60 + time.minute : null;

  // Method to convert back to TimeOfDay
  TimeOfDay? get time {
    if (timeInMinutes == null) return null;
    final hours = timeInMinutes! ~/ 60;
    final minutes = timeInMinutes! % 60;
    return TimeOfDay(hour: hours, minute: minutes);
  }

  // Updated copyWith method
  Todo copyWith({
    String? title,
    DateTime? date,
    TimeOfDay? time,
    bool? shouldNotify,
    String? description,
    bool? isCompleted, // Include the new field in the copyWith method
  }) {
    return Todo(
      title: title ?? this.title,
      date: date ?? this.date,
      time: time ?? this.time, // Convert TimeOfDay to int
      shouldNotify: shouldNotify ?? this.shouldNotify,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted, // Copy the new field
    );
  }
}
