import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelogger_app/controllers/entries_controller.dart';
import 'package:timelogger_app/utilities/sa_date_time.dart';
import 'package:timezone/timezone.dart';

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
              const Divider(),
              Expanded(
                child: Center(
                    child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Entries...',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    DateEntryItem(date: SADateTime.formatDate(TZDateTime.now(local))),
                    DateEntryItem(date: SADateTime.formatDate(TZDateTime.now(local))),
                    DateEntryItem(date: SADateTime.formatDate(TZDateTime.now(local))),
                    DateEntryItem(date: SADateTime.formatDate(TZDateTime.now(local))),
                    DateEntryItem(date: SADateTime.formatDate(TZDateTime.now(local))),
                    DateEntryItem(date: SADateTime.formatDate(TZDateTime.now(local))),
                    DateEntryItem(date: SADateTime.formatDate(TZDateTime.now(local))),
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
