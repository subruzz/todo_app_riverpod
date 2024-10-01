extension DateTimeExtensions on DateTime {
  bool isToday() {
    final today = DateTime.now();
    return year == today.year && month == today.month && day == today.day;
  }
}
