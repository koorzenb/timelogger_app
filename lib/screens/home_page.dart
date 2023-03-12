import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelogger_app/controllers/entries_controller.dart';
import 'package:timelogger_app/utilities/sa_date_time.dart';

import '../widgets/date_entry_item.dart';

class HomePage extends StatefulWidget {
  static String routename = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  Text("5h40min"),
                ],
              ),
              Row(
                children: [
                  const Text('Hours worked this week: '),
                  Text('${entriesController.hoursWorked}'),
                ],
              ),
              Row(
                children: [
                  const Text('Next week carry-over: '),
                  Text('${40 - entriesController.hoursWorked}'),
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
                        date: SADateTime.formatDate(
                          dateEntry.date,
                        ),
                        duration: const Duration(hours: 8),
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
