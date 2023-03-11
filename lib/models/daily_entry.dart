import 'package:timezone/timezone.dart';

class DateEntry {
  final TZDateTime date;
  final Duration duration;
  int lunchTime = 0;

  DateEntry({
    required this.date,
    required this.duration,
    int? lunchTime,
  });
}
