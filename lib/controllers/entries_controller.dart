import 'package:get/get.dart';
import 'package:timelogger_app/helpers/date_entry_helper.dart';
import 'package:timelogger_app/utilities/sa_date_time.dart';

import '../models/daily_entry.dart';

class EntriesController extends GetxController {
  List<DateEntry> dateEntries = [];
  int hoursWorked = 0;

  static EntriesController get getOrPut {
    try {
      return Get.find<EntriesController>();
    } catch (e) {
      return Get.put(EntriesController.create());
    }
  }

  EntriesController._() {
    initializeEntries();
  }
  // : outlooks = OutlooksStorage.box.getOutlooks();

  static EntriesController create() {
    return EntriesController._();
  }

  initializeEntries() {
    final firstDayOfTheWeek = SADateTime.firstDayOfTheWeek();

    for (var i = 0; i < 7; i++) {
      dateEntries.add(DateEntry(date: firstDayOfTheWeek.add(Duration(days: i)), duration: const Duration(hours: 8)));
    }
  }

  addDateEntry() {
    DateEntryHelper.insertDateEntry(dateEntries, '2022-11-01 08:00', const Duration(hours: 8));
    hoursWorked = DateEntryHelper.calculateHoursWorked(dateEntries);
    update();
  }
}
