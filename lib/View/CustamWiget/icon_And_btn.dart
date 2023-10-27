import 'package:flutter/material.dart';

class IconAndBtn extends StatelessWidget {
  final String title;
  final VoidCallback fun;
  final Color? col;
  final Color? textcolor;
  final double? hight;
  final double? withs;
  final Icon? icon;
  IconAndBtn(
      {required this.title,
      required this.fun,
      this.col,
      this.textcolor,
      this.hight,
      this.withs,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      width: withs,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: col,
      ),
      child: ElevatedButton(
        onPressed: fun,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            Text(
              '  $title',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: textcolor),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: col,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
