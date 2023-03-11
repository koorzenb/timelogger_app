import 'package:flutter/material.dart';
import 'package:timelogger_app/controllers/entries_controller.dart';
import 'package:timelogger_app/utilities/sa_date_time.dart';

class DateEntryItem extends StatelessWidget {
  final String date;
  const DateEntryItem({required this.date, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: EntriesController.getOrPut.addDateEntry,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Card(
          elevation: 2,
          child: Row(
            children: [
              Icon(
                Icons.chevron_right_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Expanded(child: Text("25 Nov")),
              Row(
                children: const [
                  Text("08:45"),
                ],
              )
            ],
          ),
        ),
        // ),
      ),
    );
  }
}

class DurationItem extends StatefulWidget {
  const DurationItem({Key? key}) : super(key: key);

  @override
  State<DurationItem> createState() => _DurationItemState();
}

class _DurationItemState extends State<DurationItem> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.remove_circle_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
          padding: EdgeInsets.zero,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
            ),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: const [
                Text("08:"),
                Text("45"),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_circle_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
          padding: EdgeInsets.zero,
        )
      ],
    );
  }
}
