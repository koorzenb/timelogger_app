import '../models/daily_entry.dart';
import '../utilities/sa_date_time.dart';

class DateEntryHelper {
  /// string format: '2022-11-01 08:00'
  static insertDateEntry(List<DateEntry> dateEntries, String formattedDate, Duration duration) {
    final date = SADateTime.tryParse(formattedDate);

    if (dateEntries.isEmpty) {
      dateEntries.add(DateEntry(date: date, duration: duration));
      return;
    }

    for (var i = 0; i < dateEntries.length; i++) {
      if (dateEntries[i].date.isAfter(date)) {
        dateEntries.insert(i, DateEntry(date: date, duration: duration));
        break;
      }
    }
  }

  static int calculateHoursWorked(List<DateEntry> dateEntries) {
    Duration hoursWorked = const Duration(hours: 0);

    for (var entry in dateEntries) {
      hoursWorked += entry.duration;
    }
    return hoursWorked.inHours;
  }
}
