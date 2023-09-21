// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expenses/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/models/transaction.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransaction;

  const Chart({
    Key? key,
    required this.recentTransaction,
  }) : super(key: key);


  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index
        )
      );

      double totalSum = 0.0;

      for(int index = 0; index < recentTransaction.length; index ++) {
        bool sameDay = recentTransaction[index].date.day == weekDay.day;
        bool sameMonth = recentTransaction[index].date.month == weekDay.month;
        bool sameYear = recentTransaction[index].date.year == weekDay.year;

        if(sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[index].value;
        }

      }

      return {
        "day": DateFormat.E().format(weekDay)[0],
        "value": totalSum};
    }).reversed.toList();
  }

  double get _weekTotalValue {
     return groupedTransactions.fold(0.0, (sum, transaction) {
      return sum + transaction["value"];
     });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((transaction) {
            return Flexible(
              fit: FlexFit.tight,
              child: CharBar(
                label: transaction["day"],
                value: transaction["value"],
                percentage: _weekTotalValue == 0 
                  ? 0 
                  : (transaction["value"] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
