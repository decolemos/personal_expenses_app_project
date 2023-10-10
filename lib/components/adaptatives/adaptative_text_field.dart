// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final Function(String) onSubmitted;

  const AdaptativeTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.keyBoardType = TextInputType.text,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CupertinoTextField(
        controller: controller,
        keyboardType: keyBoardType,
        onSubmitted: onSubmitted,
        placeholder: label,
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 12
        ),
      ),
    )
    : TextFormField(
      controller: controller,
      keyboardType: keyBoardType,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
        )
      ),
    );
  }
}
