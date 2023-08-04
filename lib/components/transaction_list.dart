import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    height: 400,
    child: ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Card(
          elevation: 5,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green
                  )
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  "R\$ ${transaction.value.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green
                  ),
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  Text(
                    DateFormat("d MMM y").format(transaction.date),
                    style: const TextStyle(
                      color: Colors.grey
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    ),
   );
  }
}