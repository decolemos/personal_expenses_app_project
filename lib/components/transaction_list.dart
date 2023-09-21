// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList({
    Key? key,
    required this.transactions,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    child: transactions.isEmpty
    ? LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Nenhuma despesa cadastrada!",
                  style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                  "assets/waiting.png",
                  fit: BoxFit.cover,
                ),
              ),
                      ],
                    ),
            );
       },
      ) 
    : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(
                  child: Text("R\$${transaction.value}")
                ),
              ),
            ),
            title: Text(
              transaction.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              DateFormat("d MMM y").format(transaction.date),
            ),
            trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
              onPressed: () => onRemove(transaction.id), 
              icon: const Icon(Icons.delete), 
              label: const Text("Excluir"),
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.red)
              ),
            )
            : IconButton(
              onPressed: () => onRemove(transaction.id),
              icon: const Icon(Icons.delete),
              color: Colors.red[400]
            ),
          ),
        );
      },
    ),
   );
  }
}
