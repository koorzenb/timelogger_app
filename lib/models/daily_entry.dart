class DailyEntry {
  final DateTime date;
  final Duration duration;
  Duration lunchTime = const Duration(hours: 1);

  DailyEntry({required this.date, required this.duration, Duration? lunchTime});
}
