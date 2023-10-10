// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {

  final DateTime? selectedDate;
  final Function(DateTime)? onDateChanged;

  const AdaptativeDatePicker({
    Key? key,
    this.selectedDate,
    this.onDateChanged,
  }) : super(key: key);

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2022), 
      lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate == null) return;

      onDateChanged!(pickedDate);

    });
  }


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS 
    ? SizedBox(
      height: 180,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime.now(),
        minimumDate: DateTime(2022),
        maximumDate: DateTime.now(),
        onDateTimeChanged: onDateChanged!,
      ),
    )
    : SizedBox(
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Text(
              selectedDate == null
              ? "Nenhuma data selecionada!"
              : "Data selecionada: ${DateFormat("dd/MM/yy").format(selectedDate!)}"
            ),
          ),
          TextButton(
            onPressed: () => _showDatePicker(context),
            child: Text("Selecionar Data",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold
              ),
            )
          )
        ],
      ),
    );
  }
}
