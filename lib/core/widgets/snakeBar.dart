import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void SnakeBar(String text, BuildContext context, bool isSuccess) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(text)));
}
