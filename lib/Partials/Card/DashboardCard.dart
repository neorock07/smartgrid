import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

Widget DashboardCard(BuildContext context, {
  required String label, 
  required IconData icon,
  required Color color
}){
  return Container(
    height: 140.dm,
    width: 140.dm,
    child: Stack(
      children: [
        Container(
          width: 140.dm,
          height: 140.dm,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey,spreadRadius: 0.7)
            ],
            color: Color.fromRGBO(2, 138, 234, 1),
            borderRadius: BorderRadius.circular(10.dm)
          ),
        ),

        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 136.dm,
            height: 140.dm,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.dm)
            ),
            child: Padding(
              padding: EdgeInsets.all(10.dm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: color,size: 40.dm,),
                  SizedBox(height: 20.h,),
                  Text(label, style: TextStyle(
                    color: Color.fromRGBO(0,73, 124, 1), 
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    fontFamily: "Lato"
                  ),),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}