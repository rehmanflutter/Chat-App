import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  final String title;
  final VoidCallback fun;
  final Color? col;
  TextBtn({required this.title, required this.fun, this.col});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: fun,
        child: Text(
          title,
          style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: col),
        ));
  }
}
