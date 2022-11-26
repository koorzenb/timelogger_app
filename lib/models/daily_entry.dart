class DailyEntry {
  final DateTime date;
  final Duration time;
  int lunchTime = 0;

  DailyEntry(this.date, this.time, int? lunchTime);
}
