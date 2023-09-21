import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm({super.key, required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if(title.isEmpty || value <= 0 || _selectedDate == null){
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2022), 
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate == null) return;

      setState(() {
        _selectedDate = pickedDate;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
        bottom: 10 + MediaQuery.of(context).viewInsets.bottom
      ),
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
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
            controller: _valueController,
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
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                    ? "Nenhuma data selecionada!"
                    : "Data selecionada: ${DateFormat("dd/MM/yy").format(_selectedDate!)}"
                  ),
                ),
                TextButton(
                  onPressed: _showDatePicker,
                  child: Text("Selecionar Data",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor)
                ),
                child: const Text("Nova Transação")
              ),
            ],
          )
        ],
      ),
    ),
  );
  }
}