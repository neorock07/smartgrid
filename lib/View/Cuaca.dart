import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartgrid/Partials/Button/BackButton.dart';

class Cuaca extends StatefulWidget {
  const Cuaca({Key? key}) : super(key: key);

  @override
  _CuacaState createState() => _CuacaState();
}

class _CuacaState extends State<Cuaca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 60.w),
                child: KembaliButton(context, onTap: () {
                  Navigator.pop(context);
                }),
              ),
              Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Perkiraan Cuaca",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text("Kota Semarang",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 73, 124, 1))),
          SizedBox(
            height: 10.h,
          ),
          Text("36℃",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 73, 124, 1))),
          SizedBox(
            height: 10.h,
          ),
          Text("Cerah",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(0, 73, 124, 1))),
          SizedBox(
            height: 20.h,
          ),
          Text("Jumat, 30 September 1965",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(0, 73, 124, 1))),
          SizedBox(
            height: 10.h,
          ),
          Text("04.00",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(0, 73, 124, 1))),
          SizedBox(
            height: 10.h,
          ),
          Icon(
            Icons.sunny,
            color: Colors.amber,
            size: 100.dm,
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Color.fromRGBO(2, 138, 234, 1),
                borderRadius: BorderRadius.circular(10.dm)),
            child: Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //angin
                  Column(
                    children: [
                      Text(
                        "Angin",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontSize: 16.sp,
                        ),
                      ),
                      Icon(
                        LucideIcons.wind,
                        color: Colors.white,
                        size: 30.dm,
                      ),
                      Text(
                        "20 km/h",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),

                  //kelembaban
                  Column(
                    children: [
                      Text(
                        "Kelembaban",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontSize: 16.sp,
                        ),
                      ),
                      Icon(
                        LucideIcons.droplet,
                        color: Colors.white,
                        size: 30.dm,
                      ),
                      Text(
                        "20 km/h",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),

                  //kelembaban
                  Column(
                    children: [
                      Text(
                        "Suhu maks.",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontSize: 16.sp,
                        ),
                      ),
                      Icon(
                        LucideIcons.thermometerSun,
                        color: Colors.white,
                        size: 30.dm,
                      ),
                      Text(
                        "20 km/h",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lato",
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Satu hari mendatang",
                style: TextStyle(
                    color: Color.fromRGBO(0, 73, 124, 1),
                    fontFamily: "Lato",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height:10.h),
          Container(
            height: 100.h,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 10.h),
                    child: Container(
                      height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.dm),
                          color: Color.fromRGBO(157, 216, 255, 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "13.00",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 73, 124, 1),
                                fontFamily: "Lato",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(height: 30.dm, width: 30.dm, decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/cloud_sun.png"))
                          ),),
                          Text(
                            "36℃",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 73, 124, 1),
                                fontFamily: "Lato",
                                fontSize: 14.sp,
                                
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
