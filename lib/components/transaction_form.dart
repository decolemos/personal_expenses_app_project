import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmit;

  const TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if(title.isEmpty || value <= 0){
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
  return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              onFieldSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: "Título",
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                )
              ),
            ),
            TextFormField(
              controller: valueController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onFieldSubmitted: (_) => _submitForm(),
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
                  onPressed: _submitForm,
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
    );
  }
}