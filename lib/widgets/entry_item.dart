import 'package:flutter/material.dart';

class EntryItem extends StatelessWidget {
  const EntryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          children: [
            Icon(
              Icons.chevron_right_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Expanded(child: Text("25 Nov")),
            
            Row(children: const [
              Text("08:45"),
            ],)
          ],
        ),
      ),
    );
  }
}

class DurationItem extends StatelessWidget {
  const DurationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
    )
  }
}
