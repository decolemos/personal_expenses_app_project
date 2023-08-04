import 'dart:math';
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
    const  MyHomePage({super.key} );

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final _transactions = [
    Transaction(
      id: "001", 
      title: "Novo Tênis de corrida", 
      value: 310.76, 
      date: DateTime.now()
    ),
    Transaction(
      id: "002", 
      title: "Conta de luz", 
      value: 211.30, 
      date: DateTime.now()
    ),
  ];


  void _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), 
      title: title, 
      value: value, 
      date: DateTime.now()
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.pop(context);
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              child: Card(
                color: Colors.green,
                elevation: 5,
                child: Text("Gráfico"),
              ),
            ),
            TransactionList(transactions: _transactions),
            FloatingActionButton(
              onPressed: () => _openTransactionFormModal(context),
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}