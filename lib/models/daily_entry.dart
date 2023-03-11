import 'package:timezone/timezone.dart';

class DateEntry {
  final TZDateTime date;
  Duration duration = const Duration(hours: 0);
  int lunchTime = 0;

  DateEntry({
    required this.date,
    required this.duration,
    int? lunchTime,
  });
}
