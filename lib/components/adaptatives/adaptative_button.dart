// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApaptativeButton extends StatelessWidget {

  final String label;
  final Function onPressed;

  const ApaptativeButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? CupertinoButton(
      onPressed: onPressed(),
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Text(label),
    )
    : ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor)
      ),
      onPressed: onPressed(), 
      child: Text(label, style: const TextStyle(color: Colors.white),)
    );
  }
}
