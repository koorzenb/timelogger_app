import 'package:get/get.dart';
import 'package:timelogger_app/helpers/date_entry_helper.dart';

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
    DateEntryHelper.initializeEntries(dateEntries);
  }
  // : outlooks = OutlooksStorage.box.getOutlooks();

  static EntriesController create() {
    return EntriesController._();
  }

  updateDateEntry(int idx) {
    DateEntryHelper.updateEntry(dateEntries, idx, 8);
    hoursWorked = DateEntryHelper.calculateHoursWorked(dateEntries);
    update();
  }
}
