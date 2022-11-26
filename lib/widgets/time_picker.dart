import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final Function onStageChanged;
  int stage;

  TimePicker({
    Key? key,
    required this.stage,
    required this.onStageChanged,
  }) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.remove_circle_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            setState(() {
              // widget.stage = widget.stage > 0 ? widget.stage - 1 : 0;
              // widget.onStageChanged(widget.stage);
            });
          },
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text('08:45'),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              // widget.stage = widget.stage < 8 ? widget.stage + 1 : 8;
              // widget.onStageChanged(widget.stage);
            });
          },
          icon: Icon(Icons.add_circle_outline, color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
