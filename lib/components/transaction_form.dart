import 'package:expenses/components/adaptatives/adaptative_button.dart';
import 'package:expenses/components/adaptatives/adaptative_date_picker.dart';
import 'package:expenses/components/adaptatives/adaptative_text_field.dart';
import 'package:flutter/material.dart';


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
            AdaptativeTextField(
              label: "Título",
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
            ),
            AdaptativeTextField(
              label: "Valor (R\$)",
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              keyBoardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            AdaptativeDatePicker(
              selectedDate: _selectedDate,
              onDateChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ApaptativeButton(
                  label: "Nova Transação",
                  onPressed: _submitForm,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}