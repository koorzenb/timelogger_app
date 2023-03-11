import 'package:flutter/material.dart';
import 'package:timelogger_app/widgets/date_entry_item.dart';

class HomePage extends StatefulWidget {
  static String routename = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text("charts here"),
              ),
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
                  const DateEntryItem(),
                  const DateEntryItem(),
                ],
              )),
            )
          ],
        ),
      )),
    );
  }
}
