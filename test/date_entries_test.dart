import 'package:flutter_test/flutter_test.dart';
import 'package:timelogger_app/helpers/date_entry_helper.dart';
import 'package:timelogger_app/models/daily_entry.dart';
import 'package:timelogger_app/utilities/sa_date_time.dart';

void main() {
  setUpAll(() {
    SADateTime.initializeTimeZones();
  });

  group('add entries', () {
    test('basic add/insert', () {
      List<DateEntry> dateEntries = [];
      DateEntryHelper.insertDateEntry(
        dateEntries,
        '2022-11-02 08:00',
        const Duration(hours: 5),
      );
      final expectEntries = [makeDateEntry('2022-11-01 08:00', 5)];
      expect(expectEntries[0].duration, dateEntries[0].duration);
    });

    test('add at specific date', () {
      List<DateEntry> dateEntries = [makeDateEntry('2022-11-01 08:00', 5), makeDateEntry('2022-11-03 08:00', 5)];
      DateEntryHelper.insertDateEntry(
        dateEntries,
        '2022-11-02 08:00',
        const Duration(hours: 5),
      );
      final expectEntries = [makeDateEntry('2022-11-01 08:00', 5), makeDateEntry('2022-11-02 08:00', 5), makeDateEntry('2022-11-03 08:00', 5)];
      expect(expectEntries[1].date, dateEntries[1].date);
    });

    test('update duration', () {
      List<DateEntry> dateEntries = [];
      DateEntryHelper.initializeEntries(dateEntries);
      const entryIdx = 4;
      const newDuration = 7;
      DateEntryHelper.updateEntry(dateEntries, entryIdx, newDuration);
      expect(dateEntries[entryIdx].duration, const Duration(hours: newDuration));

      final hoursWorked = DateEntryHelper.calculateHoursWorked(dateEntries);
      expect(hoursWorked, 7);
      // calc hours
    });

    test('calc week hours', () {
      List<DateEntry> dateEntries = [makeDateEntry('2022-11-01 08:00', 5), makeDateEntry('2022-11-03 08:00', 5)];
      final hoursWorked = DateEntryHelper.calculateHoursWorked(dateEntries);
      expect(hoursWorked, 10);
    });
  });
}

DateEntry makeDateEntry(String formattedDate, int duration) {
  Duration workDuration = Duration(hours: duration);
  return DateEntry(
    date: SADateTime.tryParse(formattedDate),
    duration: workDuration,
  );
}
