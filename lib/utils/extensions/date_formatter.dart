extension DateTimeFormatting on DateTime {
  String toCustomFormat() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    return '${twoDigits(year)}-${twoDigits(month)}-${twoDigits(day)}';
  }
}
