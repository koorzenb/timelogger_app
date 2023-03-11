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

  static initializeEntries(dateEntries) {
    final firstDayOfTheWeek = SADateTime.firstDayOfTheWeek();

    for (var i = 0; i < 7; i++) {
      dateEntries.add(DateEntry(date: firstDayOfTheWeek.add(Duration(days: i)), duration: const Duration(hours: 0)));
    }
  }

  static int calculateHoursWorked(List<DateEntry> dateEntries) {
    Duration hoursWorked = const Duration(hours: 0);

    for (var entry in dateEntries) {
      hoursWorked += entry.duration;
    }
    return hoursWorked.inHours;
  }

  static void updateEntry(List<DateEntry> dateEntries, int idx, int duration) {
    dateEntries[idx].duration = Duration(hours: duration);
  }
}
