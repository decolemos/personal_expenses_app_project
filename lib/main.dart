import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
     MyHomePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            child: Card(
              color: Colors.green,
              elevation: 5,
              child: Text("Gráfico"),
            ),
          ),
          Column(
            children: _transactions.map((transaction) {
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
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    
                    decoration: const InputDecoration(
                      labelText: "Título",
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                      )
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Valor (R\$)",
                      labelStyle: TextStyle(color: Colors.black),
                      
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                      )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(Color(0x0f008000))
                        ),
                        child: const Text("Nova Transação", style: TextStyle(color: Colors.green),)
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}