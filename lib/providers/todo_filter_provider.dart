import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TodoFilter { all, inProgress, completed, today }

final todoFilterType = StateProvider((ref) => TodoFilter.all);
