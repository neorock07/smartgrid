import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smartgrid/Partials/Button/BackButton.dart';
import 'package:smartgrid/Partials/Card/SplitCard.dart';
import 'package:smartgrid/Partials/Card/ToggleCard.dart';

class KontrolDaya extends StatefulWidget {
  const KontrolDaya({Key? key}) : super(key: key);

  @override
  _KontrolDayaState createState() => _KontrolDayaState();
}

class _KontrolDayaState extends State<KontrolDaya> {
  RxBool pln_condition = false.obs;
  RxBool batery_condition = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.dm),
                    bottomRight: Radius.circular(20.dm)),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(2, 138, 234, 1),
                  Color.fromRGBO(58, 152, 219, 1)
                ])),
          ),
          Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 80.w),
                    child: KembaliButton(context,
                        iconColor: Color.fromRGBO(2, 138, 234, 1),
                        backgroundColor: Colors.white, onTap: () {
                      Navigator.pop(context);
                    }),
                  ),
                  Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Kontrol Daya",
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              SplitCard(context),
              SizedBox(
                height: 80.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() => Column(
                        children: [
                          ToggleCard(context,
                              icon: Icons.electric_bolt,
                              color: Colors.amber,
                              title: "PLN",
                              isTap: pln_condition),
                          Switch(
                              value: pln_condition.value,
                              onChanged: (p) {
                                pln_condition.value = p;
                              })
                        ],
                      )),
                  Obx(() => Column(
                        children: [
                          ToggleCard(context,
                              icon: Icons.battery_charging_full,
                              color: Colors.blue,
                              title: "Baterai",
                              isTap: batery_condition),
                          Switch(
                              value: batery_condition.value,
                              onChanged: (p) {
                                batery_condition.value = p;
                              })
                        ],
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
