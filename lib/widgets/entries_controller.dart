import 'package:get/get.dart';
import 'package:timelogger_app/models/daily_entry.dart';

class EntriesController extends GetxController {
  List<DailyEntry> dailyEntries = [];

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
