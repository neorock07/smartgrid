import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smartgrid/Partials/Button/BaseButton.dart';
import 'package:smartgrid/Partials/Button/GoogleButton.dart';
import 'package:smartgrid/Partials/Form/formPassword.dart';

import '../Partials/Form/formText.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController konfController = TextEditingController();
  //untuk kondisi visibilitas password
  RxBool isVisible = true.obs;
  RxBool isVisible2 = true.obs;
  GlobalKey<FormState> global_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.h,
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Buat Akun",
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 73, 124, 1)),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            //field email
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "EMAIL",
                  style: TextStyle(
                      color: Colors.grey, fontFamily: "Lato", fontSize: 14.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                FormText(context, controller: emailController, label: "EMAIL"),
              ],
            ),
             SizedBox(
              height: 10.h,
            ),
            //field password
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PASSWORD",
                  style: TextStyle(
                      color: Colors.grey, fontFamily: "Lato", fontSize: 14.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(() => FormPassword(context,
                    label: "PASSWORD",
                    controller: passController,
                    isVisible: isVisible))
              ],
            ),
            SizedBox(height:10.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PASSWORD CONFIRMATION",
                  style: TextStyle(
                      color: Colors.grey, fontFamily: "Lato", fontSize: 14.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(() => FormPassword(context,
                    label: "PASSWORD CONFIRMATION",
                    isKonf: true,
                    controller: konfController,
                    isVisible: isVisible2))
              ],
            ),
            SizedBox(
              height: 40.h,
            ),

            /*
              tombol untuk sign in
            */
            BaseButton(context,
                height: 40.h,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Color.fromRGBO(2, 138, 234, 1),
                fontColor: Colors.white,
                label: "Sign Up",
                borderRadius: 10.dm, onTap: () {
              /*
                    function untuk Register di sini
                  */
            }),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Divider(
                        height: 1.h,
                        color: Colors.grey,
                      )),
                  Text(
                    "Or",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 73, 124, 1),
                        fontFamily: "Lato",
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Divider(
                        height: 1.h,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            /*
              tombol untuk sign in with google
            */
            GoogleButton(context,
                height: 40.h,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.white,
                fontColor: Color.fromRGBO(0, 73, 124, 1),
                label: "Google Authentication",
                borderRadius: 10.dm, onTap: () {
              /*
                    function untuk Register di sini
                  */
            }),
            SizedBox(
              height: 15.h,
            ),
            
          ],
        ),
      ),
    );
  }
}
