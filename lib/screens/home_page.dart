import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelogger_app/controllers/entries_controller.dart';

import '../widgets/date_entry_item.dart';

class HomePage extends StatefulWidget {
  static String routename = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color getTextColor(int hoursWorked) {
    if (40 - hoursWorked < 0) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    EntriesController.getOrPut;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: Theme.of(context).colorScheme.secondary,
            )),
        title: Text(
          'TimeLogger',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<EntriesController>(builder: (entriesController) {
          return Column(
            children: [
              Row(
                children: const [
                  Text('Previous week carry-over: '),
                  Text("0h00min"),
                ],
              ),
              Row(
                children: [
                  const Text('Hours worked this week: '),
                  Text('${entriesController.hoursWorked.inHours}'),
                ],
              ),
              Row(
                children: [
                  const Text('Next week carry-over: '),
                  Text(
                    '${entriesController.hoursWorked.inHours - 40}',
                    style: TextStyle(color: getTextColor(entriesController.hoursWorked.inHours)),
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: Center(
                    child: Column(
                  children: [
                    GetBuilder<EntriesController>(builder: (entriesController) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'My Entries...',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      );
                    }),
                    ...entriesController.dateEntries.map((dateEntry) {
                      final idx = entriesController.dateEntries.indexOf(dateEntry);
                      return DateEntryItem(
                        date: dateEntry.date,
                        duration: dateEntry.duration,
                        idx: idx,
                      );
                    })
                  ],
                )),
              )
            ],
          );
        }),
      )),
    );
  }
}
