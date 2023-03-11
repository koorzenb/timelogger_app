import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timelogger_app/widgets/chart_bar.dart';

import '../models/daily_entry.dart';

/// UI for showing 2week chart of hours worked
class Chart extends StatelessWidget {
  final List<DateEntry> recentTimeSlots;

  const Chart(this.recentTimeSlots);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        //index/count as this list is being generated
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;

        for (var tx in recentTimeSlots) {
          if (tx.date.day == weekDay.day && tx.date.month == weekDay.month && tx.date.year == weekDay.year) {
            //  totalSum += tx.amount;
            totalSum += 10;
          }
        }

        return {'day': DateFormat.E().format(weekDay).substring(0, 1), 'amount': totalSum};
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(data['day'] as String, data['amount'] as double, totalSpending == 0.0 ? 0.0 : (data['amount'] as double) / totalSpending),
              );
            }).toList()),
      ),
    );
  }
}
