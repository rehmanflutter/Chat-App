import 'package:flutter/material.dart';

import 'textcustam.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback fun;
  final Color? col;
  final Color? textcolor;
  final bool? loading;
  RoundButton(
      {required this.title,
      required this.fun,
      this.col,
      this.textcolor,
      this.loading = false});
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      height: media.height * 0.07,
      width: media.width,
      child: ElevatedButton(
        onPressed: fun,
        child: Center(
          child: loading == true
              ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )
              : Textcustam(
                  text: title,
                  col: textcolor,
                  weight: FontWeight.w700,
                ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: col,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
