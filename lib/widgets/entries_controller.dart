import 'package:get/get.dart';
import 'package:timelogger_app/models/daily_entry.dart';

class EntriesController extends GetxController {
  List<DailyEntry> dailyEntries = [
    DailyEntry(
      date: DateTime.now(),
      duration: const Duration(hours: 8),
    ),
    DailyEntry(
      date: DateTime.now(),
      duration: const Duration(hours: 8, minutes: 45),
    )
  ];

  static EntriesController get getOrPut {
    try {
      return Get.find<EntriesController>();
    } catch (e) {
      return Get.put(EntriesController.create());
    }
  }

  EntriesController._();
  // : outlooks = OutlooksStorage.box.getOutlooks();

  static EntriesController create() {
    return EntriesController._();
  }
}
