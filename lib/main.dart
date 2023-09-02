import 'dart:math';
import 'package:expenses/components/chart.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.black
        )
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
    const  MyHomePage({super.key} );

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<Transaction> _transactions = [
    Transaction(
      id: "000", 
      title: "Conta Antiga", 
      value: 400.00, 
      date: DateTime.now().subtract(const Duration(days: 33))
    ),
    Transaction(
      id: "001", 
      title: "Novo Tênis de corrida", 
      value: 310.76, 
      date: DateTime.now().subtract(const Duration(days: 3))
    ),
    Transaction(
      id: "002", 
      title: "Conta de luz", 
      value: 211.30, 
      date: DateTime.now().subtract(const Duration(days: 4))
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7)
      ));
    }).toList();
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransaction: _recentTransactions),
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