import 'package:flutter/foundation.dart';

class TimeSlot {
  final String id;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  // final bool lunchTime;
  // final bool holidayRate;

  TimeSlot(
    @required this.id,
    @required this.date,
    @required this.startTime,
    @required this.endTime,
  );
}
