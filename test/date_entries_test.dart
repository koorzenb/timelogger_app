import 'package:flutter_test/flutter_test.dart';
import 'package:timelogger_app/helpers/date_entry_helper.dart';
import 'package:timelogger_app/models/daily_entry.dart';
import 'package:timelogger_app/utilities/sa_date_time.dart';
import 'package:timezone/timezone.dart';
// import 'package:lsnhelper/widgets/sa_date_time.dart';
// import 'package:timezone/timezone.dart';

void main() {
  setUpAll(() {
    // SADateTime.initializeTimeZones();
  });

  group('add entries', () {
    test('basic', () {
      List<DateEntry> dateEntries = [makeDateEntry('2022-11-01 08:00', 5)];
      DateEntryHelper.addDateEntry(dateEntries);
      final expectEntries = [makeDateEntry('2022-11-01 08:00', 5)];
      expect(expectEntries[0].duration, dateEntries[0].duration);
    });

    test('add at date', () {
      List<DateEntry> dateEntries = [makeDateEntry('2022-11-01 08:00', 5), makeDateEntry('2022-11-03 08:00', 5)];
      DateEntryHelper.addDateEntry(dateEntries, '2022-11-02 08:00', 5);
      final expectEntries = [makeDateEntry('2022-11-01 08:00', 5), makeDateEntry('2022-11-02 08:00', 5), makeDateEntry('2022-11-03 08:00', 5)];
      expect(expectEntries[1].date, dateEntries[1].date);
    });
  });
}

DateEntry makeDateEntry(String date, int duration) {
  Duration workDuration = Duration(hours: duration);
  return DateEntry(
    date: SADateTime.tryParse(date) ?? SADateTime.startOfDay(TZDateTime.now(local)),
    duration: workDuration,
  );
}
