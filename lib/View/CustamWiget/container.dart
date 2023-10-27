import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Color? color;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;

  final BoxBorder? customBorder;
  final DecorationImage? decorationImage;
  final Widget? Child;

  ContainerWidget({
    this.color,
    this.borderRadius,
    this.height,
    this.width,
    this.customBorder,
    this.decorationImage,
    this.Child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: borderRadius,
          border: customBorder,
          image: decorationImage,
        ),
        child: Center(
          child: Child,
        ));
  }
}
