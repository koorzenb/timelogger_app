import 'package:flutter/material.dart';
import 'package:timelogger_app/utilities/sa_date_time.dart';
import 'package:timezone/timezone.dart';

class DateEntryItem extends StatefulWidget {
  final TZDateTime date;
  final Duration duration;
  final int idx;

  const DateEntryItem({required this.date, required this.duration, required this.idx, Key? key}) : super(key: key);

  @override
  State<DateEntryItem> createState() => _DateEntryItemState();
}

class _DateEntryItemState extends State<DateEntryItem> {
  bool hasStartingTime = false;
  TimeOfDay _startingTime = const TimeOfDay(hour: 08, minute: 00);
  TimeOfDay _endTime = const TimeOfDay(hour: 16, minute: 00);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: hasStartingTime ? _endTime : _startingTime,
    );
    if (newTime != null) {
      if (!hasStartingTime) {
        setState(() {
          _startingTime = newTime;
        });
        hasStartingTime = true;
      } else {
        setState(() {
          _endTime = newTime;
        });
        hasStartingTime = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectTime,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Card(
          elevation: 2,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.chevron_right_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Expanded(
                    child: Text(SADateTime.getWeekday(widget.date)),
                  ),
                  Text('${widget.duration.inHours}'),
                  const Text(':00'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    SADateTime.formatDate(widget.date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "${_startingTime.hour}:${_startingTime.minute} -${_endTime.hour}:${_endTime.minute}",
                    style: const TextStyle(color: Colors.grey),
                  ),
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
