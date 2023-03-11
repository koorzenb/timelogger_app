import '../models/daily_entry.dart';
import '../utilities/sa_date_time.dart';

class DateEntryHelper {
  static insertDateEntry(List<DateEntry> dateEntries, String formattedDate, Duration duration) {
    final date = SADateTime.tryParse(formattedDate);

    for (var i = 0; i < dateEntries.length; i++) {
      if (dateEntries[i].date.isAfter(date)) {
        dateEntries.insert(i, DateEntry(date: date, duration: duration));
        break;
      }
    }
  }
}
