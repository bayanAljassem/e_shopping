import 'package:flutter/material.dart';

class ContainerBottonModel extends StatelessWidget {
  final Color? bgColor;
  final double? containerWidth;
  final String itext;

  ContainerBottonModel({super.key, required this.bgColor, this.containerWidth, required this.itext});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: Container(
        height: 60,
         width: containerWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor
        ),
        child: Center(
          child: Text(
            itext,style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
          ),
        ),
      ),
    );
  }
}
