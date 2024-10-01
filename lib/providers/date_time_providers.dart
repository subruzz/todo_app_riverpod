import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider =
    StateProvider.autoDispose<DateTime>((ref) => DateTime.now());

final timeProvider = StateProvider.autoDispose<TimeOfDay?>((ref) => null);

final shouldNotifyProvider = StateProvider.autoDispose<bool>((ref) => false);
