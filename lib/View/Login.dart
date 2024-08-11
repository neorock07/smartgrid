import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smartgrid/Partials/Button/BaseButton.dart';
import 'package:smartgrid/Partials/Button/GoogleButton.dart';
import 'package:smartgrid/Partials/Form/formPassword.dart';
import 'package:smartgrid/View/Home.dart';
import 'package:smartgrid/View/LupaPass.dart';
import 'package:smartgrid/View/Register.dart';

import '../Partials/Form/formText.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  //untuk kondisi visibilitas password
  RxBool isVisible = true.obs;
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
                "Sign In",
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
                label: "Sign In",
                borderRadius: 10.dm, onTap: () {
              /*
                    function untuk login di sini
                  */
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
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
                    function untuk login di sini
                  */
            }),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum memiliki akun?",
                  style: TextStyle(
                      fontFamily: "Lato",
                      color: Color.fromRGBO(0, 73, 124, 1),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        color: Color.fromRGBO(2, 138, 234, 1),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LupaPass()));
              },
              child: Text(
                "Lupa password?",
                style: TextStyle(
                    fontFamily: "Lato",
                    color: Color.fromRGBO(2, 138, 234, 1),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
