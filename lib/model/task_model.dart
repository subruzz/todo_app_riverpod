import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final TimeOfDay time;

  @HiveField(3)
  final bool shouldNotify;

  @HiveField(4)
  final String description;

  Todo({
    required this.title,
    required this.date,
    required this.time,
    this.shouldNotify = false,
    required this.description,
  });
}
