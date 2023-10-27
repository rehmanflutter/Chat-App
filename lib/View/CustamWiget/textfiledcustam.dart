import 'package:flutter/material.dart';

class Textfiledcustam extends StatelessWidget {
  // final formKey = GlobalKey<FormState>();

  final String? hinttext;
  final String? labeltext;
  final Icon? starticon;
  final Widget? lasticon;
  final bool? obscur;
  final VoidCallback? fun;
  final bool? focus;

  final TextInputType? keyboardType;
  final TextEditingController? controller;

  Textfiledcustam({
    this.hinttext,
    this.controller,
    this.labeltext,
    this.lasticon,
    this.obscur = false,
    this.starticon,
    this.keyboardType,
    this.fun,
    this.focus = false,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      height: media.height * 0.0760,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blue.shade50),
      child: TextFormField(
        autofocus: focus!,
        // key: formKey,
        obscureText: obscur!,
        keyboardType: keyboardType,
        style: TextStyle(),
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          labelText: labeltext,
          prefixIcon: starticon,
          suffixIcon: lasticon,

          // border: InputBorder.none,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixText: '   ',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return ' ';
          } else
            return null;
        },
        onChanged: (value) {
          fun;
        },
      ),
    );
  }
}
