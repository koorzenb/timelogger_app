import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tzdb;
import 'package:timezone/timezone.dart';

class SADateTime {
  static void initializeTimeZones() {
    tzdb.initializeTimeZones();
    final saTimeZone = getLocation('Africa/Johannesburg');
    setLocalLocation(saTimeZone);
  }

  static TZDateTime get zero => fromMillisecondsSinceEpoch(0);
  static TZDateTime get now => TZDateTime.now(local);

  static TZDateTime get startOfCurrentHour {
    final currentTime = now;
    return roundToCurrentHour(currentTime);
  }

  static TZDateTime firstDayOfTheWeek() {
    var d = TZDateTime.now(local);
    int weekDay = d.weekday - 1;
    return d.subtract(Duration(days: weekDay));
  }

  static TZDateTime startOfDay(TZDateTime time) {
    return TZDateTime(time.location, time.year, time.month, time.day);
  }

  static TZDateTime roundToCurrentHour(TZDateTime currentTime) {
    return TZDateTime(local, currentTime.year, currentTime.month, currentTime.day, currentTime.hour);
  }

  /// string format: '2022-11-01 08:00'
  static TZDateTime tryParse(String formattedString) {
    TZDateTime dt;
    try {
      dt = TZDateTime.parse(local, '$formattedString+0200');
    } catch (_) {
      dt = SADateTime.startOfDay(TZDateTime.now(local));
    }

    return dt;
  }

  /// Throws a [FormatException] if the input cannot be parsed.
  /// String format: '2022-11-01 08:00'
  static TZDateTime parse(String formattedString) {
    return TZDateTime.parse(local, '$formattedString+0200');
  }

  static TZDateTime fromMillisecondsSinceEpoch(int ms) {
    return TZDateTime.fromMillisecondsSinceEpoch(local, ms);
  }

  static String formatTime(TZDateTime dateTime) {
    final formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

  static String formatDateTime(TZDateTime dateTime) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm');
    return formatter.format(dateTime);
  }

  static String formatDate(TZDateTime dateTime) {
    DateFormat formatter = DateFormat('d MMMM');
    return formatter.format(dateTime);
  }

  static getWeekday(TZDateTime dateTime) {
    final dayOfWeekFormatter = DateFormat('EEEE');
    return dayOfWeekFormatter.format(dateTime);
  }

  static isSameDay(TZDateTime time1, TZDateTime time2) {
    return (time1.year == time2.year && time1.month == time2.month && time1.day == time2.day);
  }

  static isNextDay(TZDateTime currentTime, TZDateTime nextTime) {
    return isSameDay(currentTime.add(const Duration(days: 1)), nextTime);
  }
}

class DateTimeUtility {
  static TZDateTime roundDown(TZDateTime dateTime, {Duration delta = const Duration(hours: 1)}) {
    return TZDateTime.fromMillisecondsSinceEpoch(local, dateTime.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch % delta.inMilliseconds);
  }
}
