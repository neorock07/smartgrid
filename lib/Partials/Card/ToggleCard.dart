import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget ToggleCard(BuildContext context, {
  required IconData icon,
  required String title,
  required Color color,
  required RxBool isTap
}){
  return Container(
    height: MediaQuery.of(context).size.height * 0.2,
    width: MediaQuery.of(context).size.height * 0.2,
    decoration: BoxDecoration(
      color: (isTap.value == false)? Colors.grey : Colors.white,
      boxShadow: (isTap.value==false)? null : [
        BoxShadow(
          color: Colors.blue, 
          blurRadius: 5.dm, 
          spreadRadius: 1.dm
        ),
      ],
      border: (isTap.value == false)? null : Border.all(color: Color.fromRGBO(2, 138, 234, 1)),
      borderRadius: BorderRadius.circular(10.dm),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: (isTap.value==false)? const Color.fromARGB(255, 101, 101, 101):color,size: 50.dm,),
        Text(title, style: TextStyle(
          color: (isTap.value == false)? Color.fromARGB(255, 39, 38, 38) : Color.fromRGBO(0, 73, 124, 1),
          fontFamily: "Lato", 
          fontSize: 22.sp, 
          fontWeight: FontWeight.bold
        ),),
        
      ],
    ),
  );
}