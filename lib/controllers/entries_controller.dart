import 'package:flutter/material.dart';
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

  updateDateEntry(int idx, TimeOfDay startTime, TimeOfDay endTime) {
    final duration = Duration(hours: endTime.hour - startTime.hour, minutes: endTime.minute - startTime.minute);
    DateEntryHelper.updateEntry(dateEntries, idx, duration);
    hoursWorked = DateEntryHelper.calculateHoursWorked(dateEntries);
    update();
  }
}
