import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

Widget BaseCard(BuildContext context, {
  required double height,
  required double width,
  required Widget widget}) {
  return Container(
    height: height,
    width: width,
    child: Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 0.7)],
              color: Color.fromRGBO(2, 138, 234, 1),
              borderRadius: BorderRadius.circular(10.dm)),
        ),
        widget
      ],
    ),
  );
}
