import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(2, 138, 234, 1),
      child: Text("SmartGrid",
      style: TextStyle(
        fontFamily: "Lato",
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),),
    );
  }
}