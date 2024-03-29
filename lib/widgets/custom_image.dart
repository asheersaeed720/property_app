import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(this.name,
      {Key? key,
      this.width = 100,
      this.height = 100,
      this.bgColor,
      this.borderWidth = 0,
      this.borderColor,
      this.trBackground = false,
      this.radius = 50})
      : super(key: key);
  final String name;
  final double width;
  final double height;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Theme.of(context).cardColor, width: borderWidth),
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 2),
          ),
        ],
        image: DecorationImage(image: NetworkImage(name), fit: BoxFit.cover),
      ),
    );
  }
}
