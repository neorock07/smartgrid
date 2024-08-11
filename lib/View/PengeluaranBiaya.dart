import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smartgrid/Partials/Button/BackButton.dart';
import 'package:smartgrid/Partials/Card/CardBiaya.dart';
import 'package:smartgrid/Partials/Widget/PercentBar.dart';

class PengeluaranBiaya extends StatefulWidget {
  const PengeluaranBiaya({Key? key}) : super(key: key);

  @override
  _PengeluaranBiayaState createState() => _PengeluaranBiayaState();
}

class _PengeluaranBiayaState extends State<PengeluaranBiaya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 40.w),
                  child: KembaliButton(context, onTap: () {
                    Navigator.pop(context);
                  }),
                ),
                Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Pengeluaran Biaya",
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 73, 124, 1)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Total Penghematan",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 73, 124, 1)),
            ),
            SizedBox(
              height: 20.h,
            ),
            PercentBar(context, percent: 0.6689, money: "525.000"),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "*Total penghematan pengeluaran daya dibandingkan\ndengan penggunaan PLN",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 73, 124, 1),
                    fontFamily: "Lato",
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        DraggableScrollableSheet(
            minChildSize: 0.4,
            maxChildSize: 0.5,
            initialChildSize: 0.4,
            builder: (((context, scrollController) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.4,
                          blurRadius: 0.4,
                          offset: Offset(0, 0.4)),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.dm),
                        topRight: Radius.circular(10.dm))),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: CardBiaya(context, title:"Pengeluaran minggu ini", total: "350.000")
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: CardBiaya(context, title:"Pengeluaran kondisi normal", total: "500.000")
                    ),
                  ],
                ),
              );
            })))
      ]),
    );
  }
}
