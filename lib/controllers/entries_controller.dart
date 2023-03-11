import 'package:get/get.dart';
import 'package:timelogger_app/helpers/date_entry_helper.dart';

import '../models/daily_entry.dart';

class EntriesController extends GetxController {
  List<DateEntry> dateEntries = [];
  int hoursWorked;

  static EntriesController get getOrPut {
    try {
      return Get.find<EntriesController>();
    } catch (e) {
      return Get.put(EntriesController.create());
    }
  }

  EntriesController._() : hoursWorked = 0;
  // : outlooks = OutlooksStorage.box.getOutlooks();

  static EntriesController create() {
    return EntriesController._();
  }

  addDateEntry() {
    DateEntryHelper.insertDateEntry(dateEntries, '2022-11-01 08:00', const Duration(hours: 8));
    hoursWorked = DateEntryHelper.calculateHoursWorked(dateEntries);
    update();
  }
}
